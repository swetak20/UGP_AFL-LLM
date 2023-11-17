#! /bin/bash
echo "This is a sheel script for fuzzing"
cd coreutils
ls
cd src
export AFL_SKIP_CPUFREQ=1
export AFL_TRY_AFFINITY=1
export AFL_I_DONT_CARE_ABOUT_MISSING_CRASHES=1
testfns=("nproc" "split")
mkdir ../outdir_2afl
for item in "${testfns[@]}"; do
	echo "current item: $item"
	export AFL_SKIP_CPUFREQ=1
	export AFL_TRY_AFFINITY=1
	export AFL_I_DONT_CARE_ABOUT_MISSING_CRASHES=1
	i="$item.c"
	outpfile="${item}.out"
	testfile="test_${item}"
	outputdir="output_${item}"
	 ../../AFLplusplus/afl-clang-fast "${i}" -I. -I../lib/ -I ../../AFLplusplus/utils/argv_fuzzing/ ../lib/libcoreutils.a version.c -o "${outpfile}"
	 mkdir ../outdir_2afl/"${outputdir}"
	 ../../AFLplusplus/afl-fuzz -V 600 -i ../"${testfile}"/indir/ -o ../outdir_2afl/"${outputdir}" ./"${outpfile}"

done
