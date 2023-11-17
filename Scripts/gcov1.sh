#!/bin/bash
echo "This is a shell script for gcov"
file_array=("basename" "cksum" "cat" "cp")
for item in "${file_array[@]}"; do
    i="$item.c"
    gcov_file="gcov_$item.out"
    outputdir="output_${item}"
    gcc -fprofile-arcs -ftest-coverage -g -Wall ./coreutils-9.3/src/"$i" ./coreutils-9.3/lib/libcoreutils.a -I./coreutils-9.3/lib/ ./coreutils-9.3/src/version.c -o ./gcov_1gcc/"$gcov_file"
    ./gcov_1gcc/"$gcov_file" < ./coreutils-9.3/outdir_1gcc/"$outputdir"/default/queue/id\:000000\,time\:0\,execs\:0\,orig\:in
    gcov -b -c "$item"

    gcc -fprofile-arcs -ftest-coverage -g -Wall ./coreutils-9.3/src/"$i" ./coreutils-9.3/lib/libcoreutils.a -I./coreutils-9.3/lib/ ./coreutils-9.3/src/version.c -o ./gcov_2gcc/"$gcov_file"
    ./gcov_2gcc/"$gcov_file" < ./coreutils-9.3/outdir_2gcc/"$outputdir"/default/queue/id\:000000\,time\:0\,execs\:0\,orig\:in
    gcov -b -c "$item"

    gcc -fprofile-arcs -ftest-coverage -g -Wall ./coreutils-9.3/src/"$i" ./coreutils-9.3/lib/libcoreutils.a -I./coreutils-9.3/lib/ ./coreutils-9.3/src/version.c -o ./gcov_3gcc/"$gcov_file"
    ./gcov_3gcc/"$gcov_file" < ./coreutils-9.3/outdir_3gcc/"$outputdir"/default/queue/id\:000000\,time\:0\,execs\:0\,orig\:in
    gcov -b -c "$item"

    gcc -fprofile-arcs -ftest-coverage -g -Wall ./coreutils-9.3/src/"$i" ./coreutils-9.3/lib/libcoreutils.a -I./coreutils-9.3/lib/ ./coreutils-9.3/src/version.c -o ./gcov_4gcc/"$gcov_file"
    ./gcov_4gcc/"$gcov_file" < ./coreutils-9.3/outdir_4gcc/"$outputdir"/default/queue/id\:000000\,time\:0\,execs\:0\,orig\:in
    gcov -b -c "$item"

    gcc -fprofile-arcs -ftest-coverage -g -Wall ./coreutils-9.3/src/"$i" ./coreutils-9.3/lib/libcoreutils.a -I./coreutils-9.3/lib/ ./coreutils-9.3/src/version.c -o ./gcov_5gcc/"$gcov_file"
    ./gcov_5gcc/"$gcov_file" < ./coreutils-9.3/outdir_5gcc/"$outputdir"/default/queue/id\:000000\,time\:0\,execs\:0\,orig\:in
    gcov -b -c "$item"


    gcc -fprofile-arcs -ftest-coverage -g -Wall ./coreutils/src/"$i" ./coreutils/lib/libcoreutils.a -I./coreutils/lib/ ./coreutils/src/version.c -o ./gcov_1afl/"$gcov_file"
    ./gcov_1afl/"$gcov_file" < ./coreutils/outdir_1afl/"$outputdir"/default/queue/id\:000000\,time\:0\,execs\:0\,orig\:in
    gcov -b -c "$item"

    gcc -fprofile-arcs -ftest-coverage -g -Wall ./coreutils/src/"$i" ./coreutils/lib/libcoreutils.a -I./coreutils/lib/ ./coreutils/src/version.c -o ./gcov_2afl/"$gcov_file"
    ./gcov_2afl/"$gcov_file" < ./coreutils/outdir_2afl/"$outputdir"/default/queue/id\:000000\,time\:0\,execs\:0\,orig\:in
    gcov -b -c "$item"

    gcc -fprofile-arcs -ftest-coverage -g -Wall ./coreutils/src/"$i" ./coreutils/lib/libcoreutils.a -I./coreutils/lib/ ./coreutils/src/version.c -o ./gcov_3afl/"$gcov_file"
    ./gcov_3afl/"$gcov_file" < ./coreutils/outdir_3afl/"$outputdir"/default/queue/id\:000000\,time\:0\,execs\:0\,orig\:in
    gcov -b -c "$item"

    gcc -fprofile-arcs -ftest-coverage -g -Wall ./coreutils/src/"$i" ./coreutils/lib/libcoreutils.a -I./coreutils/lib/ ./coreutils/src/version.c -o ./gcov_4afl/"$gcov_file"
    ./gcov_4afl/"$gcov_file" < ./coreutils/outdir_4afl/"$outputdir"/default/queue/id\:000000\,time\:0\,execs\:0\,orig\:in
    gcov -b -c "$item"

    gcc -fprofile-arcs -ftest-coverage -g -Wall ./coreutils/src/"$i" ./coreutils/lib/libcoreutils.a -I./coreutils/lib/ ./coreutils/src/version.c -o ./gcov_5afl/"$gcov_file"
    ./gcov_5afl/"$gcov_file" < ./coreutils/outdir_5afl/"$outputdir"/default/queue/id\:000000\,time\:0\,execs\:0\,orig\:in
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

