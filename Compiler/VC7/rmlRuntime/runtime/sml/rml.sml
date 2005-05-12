(* rml.sml *)

structure rml : rml_sig =
  struct

    type Marker		= unit			(*XXX*)
    datatype Val	= INT of int
			| REAL of real
			| STRING of string
			| TUPLE1 of Val
			| TUPLE2 of Val * Val
			| TUPLE3 of Val * Val * Val
			| TUPLE4 of Val * Val * Val * Val
			| FC of unit -> unit
			| SC0 of unit -> unit
			| SC1 of Val -> unit
			| MARKER of Marker

    fun ctorI x => x
    fun ctor_box0 tag = TUPLE1(INT tag)
    fun ctor_box1 tag (x1) = TUPLE2(INT tag, x1)
    fun ctor_box2 tag (x1,x2) = TUPLE3(INT tag, x1, x2)
    fun ctor_box3 tag (x1,x2,x3) = TUPLE4(INT tag, x1, x2, x3)

    fun prim_get_int(INT x) = x
    fun prim_fetch0(REAL _) = INT 1
      | prim_fetch0(STRING s) = INT((size s)*64+2)
      | prim_fetch0(TUPLE1(x0)) = x0
      | prim_fetch0(TUPLE2(x0,_)) = x0
      | prim_fetch0(TUPLE3(x0,_,_)) = x0
      | prim_fetch0(TUPLE4(x0,_,_,_)) = x0
    fun prim_fetch1(TUPLE2(_,x1)) = x1
      | prim_fetch1(TUPLE3(_,x1,_)) = x1
      | prim_fetch1(TUPLE4(_,x1,_,_)) = x1
    fun prim_fetch2(TUPLE3(_,_,x2)) = x2
      | prim_fetch2(TUPLE4(_,_,x2,_)) = x2
    fun prim_fetch3(TUPLE4(_,_,_,x3)) = x3
    fun prim_isptr(INT _) = INT 1
      | prim_isptr(_) = INT 0
    fun prim_marker() = MARKER()	(*XXX*)
    fun prim_restore(MARKER _) = ()	(*XXX*)
    fun prim_app_fc(FC f) = f()
    fun prim_app_sc0(SC0 f) = f()
    fun prim_app_sc1(SC1 f, x) = f x

    fun prim_bool_not(INT x) = INT(if x = 0 then 1 else 0)
    fun prim_int_neg(INT x) = INT(~x)

    fun prim_unify(x,y) = INT(if x = y then 1 else 0)	(*XXX*)
    fun prim_bool_and(INT x, INT y) =
      let val z = case (x,y)
		    of (0,_) => 0
		     | (_,0) => 0
		     | (_,_) => 1
      in
	INT z
      end
    fun prim_bool_or(INT x, INT y) =
      let val z = case (x,y)
		    of (0,0) => 0
		     | (_,_) => 1
      in
	INT z
      end
    fun prim_int_add(INT x, INT y) = INT(x+y)
    fun prim_int_sub(INT x, INT y) = INT(x-y)
    fun prim_int_mul(INT x, INT y) = INT(x*y)
    fun prim_int_div(INT x, INT y) = INT(x div y)
    fun prim_int_mod(INT x, INT y) = INT(x mod y)
    fun prim_int_max(INT x, INT y) = INT(if x > y then x else y)
    fun prim_int_min(INT x, INT y) = INT(if x > y then y else x)
    fun prim_int_lt(INT x, INT y) = INT(if x < y then 1 else 0)
    fun prim_int_le(INT x, INT y) = INT(if x <= y then 1 else 0)
    fun prim_int_eq(INT x, INT y) = INT(if x = y then 1 else 0)
    fun prim_int_ne(INT x, INT y) = INT(if x <> y then 1 else 0)
    fun prim_int_ge(INT x, INT y) = INT(if x >= y then 1 else 0)
    fun prim_int_gt(INT x, INT y) = INT(if x > y then 1 else 0)

    fun string_int(sc, fc, STRING s) =
      case Int.fromString s
	of SOME i	=> prim_app_sc1(sc, INT i)
	 | NONE		=> prim_app_fc fc

    fun print(sc, fc, x) =
      let fun p(INT i) = TextIO.output(TextIO.stdOut, Int.toString i)
	    | p(REAL r) = TextIO.output(TextIO.stdOut, Real.toString r)
	    | p(STRING s) = TextIO.output(TextIO.stdOut, s)
	    | p(_) = TextIO.output(TextIO.stdErr, "rml: non-trivial print\n")
      in
	p x;
	prim_app_sc0 sc
      end

  end (* structure rml *)
