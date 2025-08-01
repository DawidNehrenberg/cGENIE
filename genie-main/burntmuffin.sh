#!/bin/bash -e
#
#####################################################################
### SCIPT TO META-CONFIGURE AND RUN CGENIE.MUFFIN ###################
#####################################################################
#
echo ""
#
# (0) USER OPTIONS
# ----------------
#####################################################################
# CHANGE THIS FOR INSTALLATIONS OTHER THAN IN $HOME
# SET THE SAME AS IN user.mak AND user.sh
# set home directory
HOMEDIR=$HOME
#####################################################################
# set output directory
OUTPUTDIR=$HOMEDIR/cgenie_output
# ensure rocks can find xsltproc
export PATH=$PATH:/opt/rocks/bin:/usr/bin
export PATH=$PATH:/share/apps/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/share/apps/lib:/share/apps/netcdf/lib
# also ifort ...
export PATH=/state/partition1/apps/intel/bin:$PATH
# ensure stack size is adequate (could be ulimit -s unlimited ?)
ulimit -s 20480
#
# (1) GET PASSED PARAMETERS
# -------------------------
# [1] base configuration ID
if [ -z "$1" ]; then
    echo "Usage: '$1' 1st parameter must be the base configuration ID"
    exit 65
  else
    MODELID="$1"
fi
# [2] set user (experiment) configuration file directory
if [ -z "$2" ]; then
    echo "Usage: '$2' 2nd parameter must be the user (experiment) configuration file directory"
    exit 65
  else
    GOINDIR=$HOMEDIR/cgenie.muffin/genie-userconfigs/"$2"
fi
# [3] set run ID (input run ID (= user configuration file name))
if [ -z "$3" ]; then
    echo "Usage: '$3' 3rd parameter must be the run ID"
    exit 65
  else
    RUNID="$3"
fi
if [ $(expr length "$3") -gt 95 ] ; then
    echo "Usage: '$3' 3rd parameter must be less than 96 characters in length"
    exit 65
fi
GOIN=$GOINDIR/$RUNID
# [4] set run duration
if [ -z "$4" ]; then
    echo "Usage: '$4' 4th parameter must be the run length (years)"
    exit 65
  else
    RUNLENGTH="$4"
fi
# [5] restart path (optional)
if [ -n "$5" ]; then
  RESTARTPATH=$OUTPUTDIR/"$5"
    if [ $(expr length "$5") -gt 95 ] ; then
        echo "Usage: '$5' 5th parameter must be less than 96 characters in length"
        exit 65
    fi
fi
#
# (2) SET LOCAL FILE AND DIRECTORY NAMES
# --------------------------------------
#
OMP_NUM_THREADS=2
export OMP_NUM_THREADS
#
OUTPUTPATH=$OUTPUTDIR/$RUNID
CONFIGPATH=$HOMEDIR/cgenie.muffin/genie-main/configs
CONFIGNAME=$RUNID".config"
BINARYPATH=$HOMEDIR/cgenie.muffin/genie-main
RESTARTNAME="rst.1"
#
# (3) CHECK PARAMETERS
# --------------------------------------
#
echo ">> Checking parameters ..."
#
# NOTE: deal with ".config" being accidently included in the run command
#
if test -e $CONFIGPATH/$MODELID
then
    echo "   #0 Removing .config from base configuration name (before adding it back again later ...): "
    echo $MODELID
    MODELID=${MODELID::-7}
fi
if test -e $CONFIGPATH/$MODELID".config"
then
    echo "   #1 Experiment base configuration: "
    echo $CONFIGPATH/$MODELID".config"
    echo " found :)"
else
    echo "   #1 Experiment base configuration: "
    echo $CONFIGPATH/$MODELID".config"
    echo " CANNOT be found :("
    exit 1
fi
if test -d $GOINDIR
then
    echo "   #2 Experiment user configuration file directory: "
    echo $GOINDIR
    echo " found :)"
else
    echo "   #2 Experiment user configuration file directory: "
    echo $GOINDIR
    echo " CANNOT be found :("
    exit 1
fi
if test -e $GOIN
then
    echo "   #3 User-config file: "
    echo $GOIN
    echo " found :)"
else
    echo "   #3 User-config file: "
    echo $GOIN
    echo " CANNOT be found :("
    exit 1
fi
if [ $(expr length "$3") -gt 127 ] ; then
    echo "Usage: '$3' 3rd parameter must be less than 128 characters in length"
    exit 65
fi
if [ -n "$5" ]; then
    if test -e $RESTARTPATH
    then
        echo "   #5 Restart file: "
        echo $RESTARTPATH
        echo " found :)"
    else
        echo "   #5 Restart file: "
        echo $RESTARTPATH
        echo " CANNOT be found :("
        exit 1
    fi
    if [ $(expr length "$5") -gt 127 ] ; then
        echo "Usage: '$5' 5th parameter must be less than 128 characters in length"
        exit 65
    fi
else
    echo "   #5 NO restart specified"
fi
#
# (3) CREATE RUN CONFIG FILE
# --------------------------
echo ""
echo ">> Configuring ..."
# Copy template config file
cp -f $CONFIGPATH/$MODELID".config" $CONFIGPATH/$CONFIGNAME
# Set the experiment run name
#echo EXPID=$MODELID.$RUNID >> $CONFIGPATH/$CONFIGNAME
echo EXPID=$RUNID >> $CONFIGPATH/$CONFIGNAME
echo ma_expid_name=$RUNID >> $CONFIGPATH/$CONFIGNAME
#
## (4) SET MODEL TIME-STEPPING
## ---------------------------
# report final time-stepping settings
# define primary model time step
echo ma_genie_timestep=2700 >> $CONFIGPATH/$CONFIGNAME #plasim atmosphere timestep
echo "  model timestep: " $ma_genie_timestep
# write relative time-stepping
echo ma_ksic_loop=16 >> $CONFIGPATH/$CONFIGNAME #atm:sic
echo ma_kocn_loop=16 >> $CONFIGPATH/$CONFIGNAME #atm:ocn
echo ma_conv_kocn_katchem=10 >> $CONFIGPATH/$CONFIGNAME #ocn:ATCHEM
echo ma_conv_kocn_kbiogem=10 >> $CONFIGPATH/$CONFIGNAME #ocn:BIOGEM
echo ma_conv_kocn_ksedgem=180 >> $CONFIGPATH/$CONFIGNAME #ocn:SEDGEM
echo ma_conv_kocn_krokgem=10 >> $CONFIGPATH/$CONFIGNAME #ocn:ROKGEM
#echo ma_kgemlite=$N_TIMESTEPS >> $CONFIGPATH/$CONFIGNAME
# set BIOGEM run length
echo bg_par_misc_t_runtime=$RUNLENGTH >> $CONFIGPATH/$CONFIGNAME
# set SEDGEM sediment age
echo sg_par_misc_t_runtime=$RUNLENGTH >> $CONFIGPATH/$CONFIGNAME
# set overall GENIE run length
let stp=11520*$RUNLENGTH #1 plasim yr (32*360) * run length
echo ma_koverall_total=$stp >> $CONFIGPATH/$CONFIGNAME
echo ma_dt_write=$stp >> $CONFIGPATH/$CONFIGNAME


# DELETED A BUNCH OF STUFF HERE - would need fixing for full version!

# (7) OVER-RIDE DEFAULTS
# ----------------------
echo bg_ctrl_force_oldformat=.false. >> $CONFIGPATH/$CONFIGNAME
#
# (8) INCORPORATE RUN CONFIGURATION
# ---------------------------------
echo "   Make safe goin format"
#dos2unix $GOIN
#tr ‘\r’ ‘\n’ < $GOIN
cat $GOIN >> $CONFIGPATH/$CONFIGNAME
#
# (9) GO!
# -------
# Run model ...
echo ""
echo ">> Here we go ..."
echo ""
cd $BINARYPATH
# test for change of base-config
if test -e 'current_config.dat'
then
    current_config=$(<'current_config.dat')
    if [ "$current_config" != "$MODELID" ]; then
        echo ">> Use of different base-config detected, so ... (make cleanall) ..."
        echo ""
        sleep 2
        make cleanall
        echo "$MODELID" > 'current_config.dat'
    fi
else
    echo ">> WARNING: No record of last base-config (file: current_config.dat): CONTINUING ..."
    echo ""
    sleep 4
    make cleanall
    echo "$MODELID" > 'current_config.dat'
fi
./genie_example.job -O -f $CONFIGPATH/$CONFIGNAME
# Clean up and archive
rm -f $CONFIGPATH/$CONFIGNAME
echo ""
echo ">> Archiving ..."
cd $OUTPUTDIR
tar cfz $RUNID.tar.gz $RUNID
mv $RUNID.tar.gz $HOMEDIR/cgenie_archive/$RUNID.tar.gz
cd $BINARYPATH
echo ">> All done - now go and play outside"
echo ""
#
