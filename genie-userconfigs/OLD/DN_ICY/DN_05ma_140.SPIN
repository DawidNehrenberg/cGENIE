# *******************************************************************
# *** USERCONFIG.PALEO.BIOGEM.PO4.SPIN ******************************
# *******************************************************************
#
# *** CLIMATE *******************************************************
#
# set climate feedback (climate responding to changing pCO2)
ea_36=y
#
# *** DATA SAVING ***************************************************
#
# BASIC + biology + tracer + proxy diagnostics
bg_par_data_save_level=15
bg_ctrl_debug_lvl0=.true.
ma_debug_loop=1
# *** recommended ***************************************************
bg_par_infile_slice_name='save_timeslice_EVERY000500.dat'
#
# *** FORCINGS ******************************************************
#
# specify forcings -- restoring of atmopsheric pCO2 and d13C
bg_par_forcing_name='pyyyyz.RpCO2_RpO2'
bg_par_atm_force_scale_val_3=140E-06 
bg_par_atm_force_scale_val_6=0.2159 # Restoring pO2 forcing set from SCION
#
# *** MISC **********************************************************
# carbonate chem handling options from muffin manual
# number of pH solution iterations
gm_par_carbchem_pH_iterationmax=1000
# re-seed pH?
gm_ctrl_carbchem_pHseed_retry=.true.
# disable carbonate chemistry updating for time-slices
#bg_ctrl_data_save_slice_carb_update=.false.
# force full carbonate chemistry updating
bg_ctrl_carbchemupdate_full = .true.
#adjusting planetary albedo to match LGM (muffin manual)
ea_albedop_offs=0.200
ea_albedop_amp=0.360
ea_albedop_skew=0.0
ea_albedop_skewp=4
ea_albedop_mod2=-15.000
ea_albedop_mod4=-2.500
ea_albedop_mod6=0.000
#Changing radiative forcings to match LGM (muffin manual)
# glacial CO2 radiative forcing
ea_radfor_scl_co2=0.6835
# glacial CH4 radiative forcing
ea_radfor_scl_ch4=0.5
# glacial N2O radiative forcing
ea_radfor_scl_n2o=0.8
#Changing orbital config to match LGM (muffin manual)
ea_opt_orbit_old=.false.
ea_par_orbit_osce=0.018994
ea_par_orbit_oscobl=0.4005
ea_par_orbit_osclonperi=1.9970
ea_par_orbit_oscsob=0.389911
ea_par_orbit_oscgam=114.42
