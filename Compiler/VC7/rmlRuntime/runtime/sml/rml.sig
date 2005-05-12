(* rml.sig *)

signature rml_sig =
  sig

    type Marker
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

    val ctorI		: Val -> Val
    val ctor_box0	: int -> Val
    val ctor_box1	: int -> Val -> Val
    val ctor_box2	: int -> Val * Val -> Val
    val ctor_box3	: int -> Val * Val * Val -> Val

    val prim_get_int	: Val -> int
    val prim_fetch0	: Val -> Val
    val prim_fetch1	: Val -> Val
    val prim_fetch2	: Val -> Val
    val prim_fetch3	: Val -> Val
    val prim_isptr	: Val -> Val
    val prim_marker	: unit -> Val
    val prim_restore	: Val -> unit
    val prim_app_fc	: Val -> unit
    val prim_app_sc0	: Val -> unit
    val prim_app_sc1	: Val * Val -> unit

    val prim_bool_not	: Val -> Val
    val prim_int_neg	: Val -> Val

    val prim_unify	: Val * Val -> Val
    val prim_bool_and	: Val * Val -> Val
    val prim_bool_or	: Val * Val -> Val
    val prim_int_add	: Val * Val -> Val
    val prim_int_sub	: Val * Val -> Val
    val prim_int_mul	: Val * Val -> Val
    val prim_int_div	: Val * Val -> Val
    val prim_int_mod	: Val * Val -> Val
    val prim_int_max	: Val * Val -> Val
    val prim_int_min	: Val * Val -> Val
    val prim_int_lt	: Val * Val -> Val
    val prim_int_le	: Val * Val -> Val
    val prim_int_eq	: Val * Val -> Val
    val prim_int_ne	: Val * Val -> Val
    val prim_int_ge	: Val * Val -> Val
    val prim_int_gt	: Val * Val -> Val

    val string_int	: Val * Val * Val -> unit
    val print		: Val * Val * Val -> unit

  end (* signature rml_sig *)
