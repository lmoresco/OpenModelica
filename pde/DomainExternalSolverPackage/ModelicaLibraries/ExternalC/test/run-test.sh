#! /bin/sh

testname=$1;

case $testname in
    test_laplace) echo -n "test_laplace... ";
      ./test_laplace square.bamg 23 P1 square_bc.txt out_a.txt out_m.txt out_g.txt 2> /dev/null ;
      diff out_a.txt out/test_laplace_a.txt  || exit 1;
      diff out_m.txt out/test_laplace_m.txt  || exit 1;
      diff out_g.txt out/test_laplace_g.txt  || exit 1;
      echo "ok.";
      ;;
    test_row) echo -n "test_row... ";
	./test_row square.bamg 23 square_bc.txt 12  2> /dev/null > out_row.txt;
	diff out_row.txt out/test_row.txt || exit 1;
	echo "ok.";
	;;

    test_formsize) echo -n "test_formsize... ";	
	./test_formsize square.bamg 23 P1 square_bc.txt 2> /dev/null > out_formsize.txt;
	diff out_formsize.txt out/test_formsize.txt || exit 1;
	echo "ok.";
	;;

    test_form) echo -n "test_form... ";	
	./test_form square.bamg 23 P1 square_bc.txt 11 12 2> /dev/null > out_form.txt;
	diff out_form.txt out/test_form.txt || exit 1;
	echo "ok.";
	;;

    test_indices) echo -n "test_indices... ";	
	./test_indices square.bamg 23 P1 square_bc.txt 11 12 2> /dev/null > out_indices.txt;
	diff out_indices.txt out/test_indices.txt || exit 1;
	echo "ok.";
	;;

    *) echo "Undefined test $testname" ;;

esac 