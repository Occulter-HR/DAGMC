#!/bin/bash

set -ex

source ${docker_env}

rm -rf ${double_down_build_dir}/bld ${double_down_install_dir}
mkdir -p ${double_down_build_dir}/bld
cd ${double_down_build_dir}
git clone https://github.com/pshriwise/double-down
ln -snf double-down src

cd ${double_down_build_dir}/bld
cmake ${double_down_build_dir}/src -DCMAKE_INSTALL_PREFIX=${double_down_install_dir} \
      -DMOAB_DIR=${moab_install_dir} -DEMBREE_DIR=$HOME/EMBREE/
make -j${ci_jobs}
make install
cd
