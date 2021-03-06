#!/bin/bash

#-----------------------------------------------------------------------------
#
# Run snow2mdl regression test on Jet.
#
# Set $DATA to your working directory.  Set the project code (SBATCH -A)
# and queue (SBATCH -q) as appropriate.
#
# Invoke the script as follows:  sbatch $script
#
# Log output is placed in regression.log.  A summary is
# placed in summary.log
#
# The test fails when its output does not match the baseline file
# as determined by the 'cmp' command.  The baseline file is
# stored in HOMEreg.
#
#-----------------------------------------------------------------------------

#SBATCH --nodes=1
#SBATCH --partition=sjet
#SBATCH --time 0:01
#SBATCH --account=emcda
#SBATCH --job-name=snow2mdl
#SBATCH -o regression.log
#SBATCH -e regression.log

set -x

source ../../sorc/machine-setup.sh > /dev/null 2>&1
source ../../modulefiles/build.$target

export DATA="/mnt/lfs3/projects/emcda/$LOGNAME/stmp/reg_tests.snow2mdl"

#-----------------------------------------------------------------------------
# Should not have to change anything below.
#-----------------------------------------------------------------------------

export HOMEreg=/lfs3/HFIP/emcda/George.Gayno/reg_tests/snow2mdl
export HOMEgfs=$PWD/../..
export WGRIB=/apps/wgrib/1.8.1.0b/bin/wgrib
export WGRIB2=/apps/wgrib2/0.1.9.6a/bin/wgrib2

rm -fr $DATA

./snow2mdl.sh

exit 0
