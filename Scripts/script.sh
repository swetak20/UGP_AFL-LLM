#! /bin/bash
echo "This is a sheel script for fuzzing"
cd coreutils-9.3
ls
cd src
export AFL_SKIP_CPUFREQ=1
export AFL_TRY_AFFINITY=1
export AFL_I_DONT_CARE_ABOUT_MISSING_CRASHES=1
testfns=("basename""cksum""cat""cp")
mkdir ../outdir
for i in $(ls); do
	export AFL_SKIP_CPUFREQ=1
	export AFL_TRY_AFFINITY=1
	export AFL_I_DONT_CARE_ABOUT_MISSING_CRASHES=1
	item="${i%%.*}"
	outpfile="${item}.out"
	outputdir="output_${item}"
	 ../../AFLplusplus/afl-gcc "${i}" -I. -I../lib/ ../lib/libcoreutils.a version.c -o "${outpfile}"
	 if [[ ${testfns[@]} =~ $item ]]
	 then
		 testfile="test_${item}"
	 else
	 	testfile="test_common"
	 fi
	 mkdir ../outdir/"${outputdir}"
	 ../../AFLplusplus/afl-fuzz -V 600 -i ../"${testfile}"/indir/ -o ../outdir/"${outputdir}" ./"${outpfile}"

done
