#!/bin/sh
# run unit tests on the code in PWD
export prog=${BASH_SOURCE[0]##*/}
echo $prog

# this is build_dir/scripts/sandbox-run-unit-tests.sh
export full_build_dir=$(readlink -f $prog)
export build_dir=${full_build_dir%/*}
echo $build_dir
export build_dir=`pwd`
echo $build_dir
echo "[${prog}]: build_dir=${build_dir}"
export app_name=aaa
echo "[${prog}]: app_name=${app_name}"
export version=10.1
echo "[${prog}]: version=${version}"

# temp dir for testing so we don't confuse Git with logfiles
export test_dir="${build_dir}/.test/${app_name}/${version}"
echo "[${prog}]: test_dir=${test_dir}"

# link everything from build_dir
rm -rf "$test_dir"
mkdir -p "$test_dir"
ln -s "$build_dir"/* "$test_dir"/

echo "copy binaries (in case build_dir is not already in app_name/version format)"
rm -f "$test_dir"/bin
cp -pr "$build_dir"/bin "$test_dir"/

echo "# remove any logfiles that happen to be symlinked"
find "$test_dir"/ -mindepth 1 -maxdepth 1 -type l -name 'unit_tests_batch.*.log' | xargs -rtn1 rm
find "$test_dir"/ -mindepth 1 -maxdepth 1 -type l -name 'unit_tests.*.log' | xargs -rtn1 rm
find "$test_dir"/ -mindepth 1 -maxdepth 1 -type l -name 'test_*.*.log' | xargs -rtn1 rm

export GCOV=/root/bin/gcov
echo "[${prog}]: GCOV=${GCOV}"
# keep all logs for further study
echo "[${prog}]: TEST_KEEP_LOGS=${TEST_KEEP_LOGS:=1}"
# just run with -g DLLs by default (you need to override this if you don't build debug in your area)
echo "[${prog}]: TEST_BUILD_CONFIGURATIONS=${TEST_BUILD_CONFIGURATIONS:=debug}"
export TEST_REPORT_FAILS_ONLY TEST_BUILD_CONFIGURATIONS TEST_KEEP_LOGS

if [[ $TEST_SCRIPTS ]]; then
  echo "[${prog}]: TEST_PLINUX_DEBUG_SCRIPTS=${TEST_PLINUX_DEBUG_SCRIPTS:=$TEST_SCRIPTS}"
  echo "[${prog}]: TEST_PLINUX_GCOV_SCRIPTS=${TEST_PLINUX_GCOV_SCRIPTS:=$TEST_SCRIPTS}"
  echo "[${prog}]: TEST_PLINUX_ASAN_SCRIPTS=${TEST_PLINUX_ASAN_SCRIPTS:=$TEST_SCRIPTS}"
  export TEST_PLINUX_DEBUG_SCRIPTS TEST_PLINUX_GCOV_SCRIPTS TEST_PLINUX_ASAN_SCRIPTS
fi

sh unit_tests.sh