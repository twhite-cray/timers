#!/bin/bash

module load PrgEnv-cray
export MV2_USE_CUDA=1
export MV2_ENABLE_AFFINITY=0
export OMP_NUM_THREADS=4
ulimit -c unlimited
rm -f core*
set -x
srun --exclusive -n16 -c${OMP_NUM_THREADS} ./a.out
srun --exclusive -n1 -c${OMP_NUM_THREADS} ./a.out
export OMP_NUM_THREADS=1
srun --exclusive -n16 -c${OMP_NUM_THREADS} ./a.out
srun --exclusive -n1 -c${OMP_NUM_THREADS} ./a.out


