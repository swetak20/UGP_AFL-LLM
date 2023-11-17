#!/bin/bash
echo "This is a shell script for gcov split"
file_array=("split")
for ((idx = 1; idx <= 5; idx++)); do
	echo "Iteration $i"
for item in "${file_array[@]}"; do
   i="$item.c"
   gcov_file="gcno_$item"
   outputdir="output_${item}"
    gcc -fprofile-arcs -ftest-coverage -g -Wall ./coreutils2/src/"$i" ./coreutils-9.3/lib/libcoreutils.a -I./coreutils-9.3/lib/ ./coreutils-9.3/src/version.c -o ./gcov_"$idx"gcc/"$gcov_file"
    for tests in ./coreutils-9.3/outdir_"$idx"gcc/"$outputdir"/default/queue/*; do ./gcov_"$idx"gcc/"$gcov_file"; done
    gcov -b -c "$item"

    gcc -fprofile-arcs -ftest-coverage -g -Wall ./coreutils2/src/"$i" ./coreutils/lib/libcoreutils.a -I./coreutils/lib/ ./coreutils2/src/version.c -o ./gcov_"$idx"afl/"$gcov_file"
    for tests in ./coreutils/outdir_"$idx"afl/"$outputdir"/default/queue/*; do ./gcov_"$idx"afl/"$gcov_file"; done
    gcov -b -c "$item"

done
done	
