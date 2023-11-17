#!/bin/bash
echo "This is a shell script for gcov"
cd coreutils
cd src
file_array=(*)
cd ../../
for i in "${file_array[@]}"; do
    item="${i%%.*}"
    gcov_file="gcov_$item.out"
    outputdir="output_${item}"
    gcc -fprofile-arcs -ftest-coverage -g -Wall ./coreutils-9.3/src/"$i" ./coreutils-9.3/lib/libcoreutils.a -I./coreutils-9.3/lib/ ./coreutils-9.3/src/version.c -o ./gcov_gcc/"$gcov_file"
    ./gcov_gcc/"$gcov_file" < ./coreutils-9.3/outdir/"$outputdir"/default/queue/id\:000000\,time\:0\,execs\:0\,orig\:in
    gcov -b -c "$item"

    gcc -fprofile-arcs -ftest-coverage -g -Wall ./coreutils-9/src/"$i" ./coreutils-9/lib/libcoreutils.a -I./coreutils-9/lib/ ./coreutils-9/src/version.c -o ./gcov_afl/"$gcov_file"
    ./gcov_gcc/"$gcov_file" < ./coreutils-9.3/outdir/"$outputdir"/default/queue/id\:000000\,time\:0\,execs\:0\,orig\:in
    gcov -b -c "$item"

done


#i=basename.c
#item=basename
#gcc -fprofile-arcs -ftest-coverage -g -Wall ./coreutils-9.3/src/"$i" ./coreutils-9.3/lib/libcoreutils.a -I./coreutils-9.3/lib/ ./coreutils-9.3/src/version.c -o gcov_basename.out

#./gcov_basename.out < ./coreutils-9.3/outdir/output_basename/default/queue/id\:000000\,time\:0\,execs\:0\,orig\:in
#gcov -b -c "$item"

# for i in $(ls); do
#	mytest="mytest-${i%%.*}"
#	echo "this is mytest ${mytest}"
#	item="${i%%.*}"
#	echo "this is item ${item}"
#	outputdir="output_${item}"
#	echo "this is outputdir $outputdir"
#	gcc -fprofile-arcs -ftest-coverage "${i}" -I. -I../lib ../lib/libcoreutils.a version.c -o "${mytest}"
#	for tests in ../outdir/"${outputdir}"/default/queue/*; do echo "${tests}"; ./"${mytest}" `cat "${tests}"`; done
#      	testgcov="${item}.gcno"
#	gcov -b -c "${item}"	
#done    

