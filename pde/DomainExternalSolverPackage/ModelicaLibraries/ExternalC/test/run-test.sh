#! /bin/sh

testname=$1;

case $testname in
    test_laplace) echo -n "test_laplace... ";
      ./test_laplace square.bamg 31 P1 square_bc.txt out_a.txt out_m.txt out_g.txt 2> /dev/null ;
      diff out_a.txt out/test_laplace_a.txt  || exit 1;
      diff out_m.txt out/test_laplace_m.txt  || exit 1;
      diff out_g.txt out/test_laplace_g.txt  || exit 1;
      echo "ok.";
      ;;
    test_row) echo -n "test_row... ";
	./test_row square.bamg 31 square_bc.txt 20  2> /dev/null > out_row.txt;
	diff out_row.txt out/test_row.txt || exit 1;
	echo "ok.";
	;;

    test_formsize) echo -n "test_formsize... ";	
	./test_formsize square.bamg 31 P1 square_bc.txt 2> /dev/null > out_formsize.txt;
	diff out_formsize.txt out/test_formsize.txt || exit 1;
	echo "ok.";
	;;

    test_formsizebdr) echo -n "test_formsizebdr... ";	
	./test_formsizebdr square.bamg 31 P1 square_bc2.txt 5 2> /dev/null > out_formsizebdr.txt;
	diff out_formsizebdr.txt out/test_formsizebdr.txt || exit 1;
	echo "ok.";
	;;

    test_form) echo -n "test_form... ";	
	./test_form square.bamg 31 P1 square_bc.txt 13 18 2> /dev/null > out_form.txt;
	diff out_form.txt out/test_form.txt || exit 1;
	echo "ok.";
	;;

    test_formbdr) echo -n "test_formbdr... ";	
	./test_formbdr square.bamg 31 P1 square_bc2.txt 22 9 3 2> /dev/null > out_formbdr.txt;
	diff out_formbdr.txt out/test_formbdr.txt || exit 1;
	echo "ok.";
	;;

    test_indices) echo -n "test_indices... ";	
	./test_indices square.bamg 31 P1 square_bc.txt 13 18 2> /dev/null > out_indices.txt;
	diff out_indices.txt out/test_indices.txt || exit 1;
	echo "ok.";
	;;

    test_bdr_coords) echo -n "test_bdr_coords... ";	
	./test_bdr_coords.exe square.bamg 31 P1 square_bc2.txt 7 0 2 5 2> /dev/null > out_bdr_coords.txt;
	diff out_bdr_coords.txt out/test_bdr_coords.txt || exit 1;
	echo "ok.";
	;;



    *) echo "Undefined test $testname" ;;

esac 