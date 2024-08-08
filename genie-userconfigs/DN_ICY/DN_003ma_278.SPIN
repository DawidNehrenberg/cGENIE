#
#
# --- CLIMATE -------------------------------------------------------
#
# set no climate feedback
ea_36=n
#
# *** BIOLOGICAL NEW PRODUCTION *************************************
# using the Crichton scheme
# *** recommended ***************************************************
# biological scheme ID string
# bg_par_bio_prodopt='bio_P'
# biological uptake time-scale
# bg_par_bio_tau=63.3827
# [PO4] M-M half-sat value (mol kg-1)
#bg_par_bio_c0_PO4=0.10E-06
# *** published paleo configuration *********************************
###bg_par_bio_prodopt='1N1T_PO4MM'
###bg_par_bio_k0_PO4=8.9876e-006
###bg_par_bio_c0_PO4=8.9369e-007
# *** Crichton et al. [2020] calibration ****************************
# NOTE: light limitation term is different in biological scheme 1N1T_PO4MM_Tdep compared to bio_P
bg_par_bio_prodopt='1N1T_PO4MM_Tdep'
bg_par_bio_mu1=10 # Max growth rate term (multiplier)
bg_par_bio_c0_PO4=8.9369e-007 # [PO4] M-M half-sat value (mol kg-1)
bg_par_bio_k0_PO4=8.9876e-006 # maximum rate of conversion of dissolved PO4 into organic matter by phytoplankton (mol kg-1 yr-1) [added in from Crichton to AR Template]
#
# *** ORGANIC MATTER EXPORT RATIOS **********************************
#
# production fraction of dissolved organic matter
bg_par_bio_red_DOMfrac=0.66
#
# *** INORGANIC MATTER EXPORT RATIOS ********************************
# Note that this could be modified to match Crichton et al., who use a different (exponential formulation for <200Ma)
#
# fixed CaCO3:POC
bg_opt_bio_CaCO3toPOCrainratio='FIXED'
# underlying export CaCO3 as a proportion of particulate organic matter (i.e., CaCO3/POC)
bg_par_bio_red_POC_CaCO3=0.200
# *** alternative for > 200 Ma **************************************
# bg_par_bio_red_POC_CaCO3=0.0
#
# *** REMINERALIZATION **********************************************
#
# *** recommended ***************************************************
# set 'instantaneous' water column remineralziation
# bg_par_bio_remin_sinkingrate_physical=9.9E9
# bg_par_bio_remin_sinkingrate_reaction=125.0
# *** common settings ***********************************************
# DOC lifetime (yrs)
bg_par_bio_remin_DOMlifetime=0.5
# initial fractional abundance of POC component #2
bg_par_bio_remin_POC_frac2=0.0557
# depth of remineralization or particulate organic matter
bg_par_bio_remin_POC_eL1=589.9451
# remineralization length #2 for POC
bg_par_bio_remin_POC_eL2=1000000.0
# initial fractional abundance of CaCO3 component #2
bg_par_bio_remin_CaCO3_frac2=0.45
# depth of remineralization or CaCO3
bg_par_bio_remin_CaCO3_eL1=1.8905e+003
# remineralization length #2 for CaCO3
bg_par_bio_remin_CaCO3_eL2=1000000.0
# *** Crichton et al. [2020] temeprature-dependent remin ************
bg_ctrl_bio_remin_POC_fixed=.false.
bg_par_bio_remin_sinkingrate=125.0 [added in by RGS from Crichton et al. Not in AR template]
bg_par_bio_remin_POC_K1=9.0E11
bg_par_bio_remin_POC_Ea1=54000.0
bg_par_bio_remin_POC_K2=1.0E14
bg_par_bio_remin_POC_Ea2=80000.0
bg_par_bio_remin_POC_frac2=0.008
#
# --- IRON ----------------------------------------------------------
#
# aeolian Fe solubility
bg_par_det_Fe_sol=0.00291468
#exponent for aeolian Fe solubility [use 1.0 for uniform solubility]
bg_par_det_Fe_sol_exp=0.500
# modifier of the scavenging rate of dissolved Fe
bg_par_scav_Fe_sf_POC=1.338130
bg_par_scav_Fe_sf_CaCO3=0.000
bg_par_scav_Fe_sf_opal=0.000
bg_par_scav_Fe_sf_det=0.000
# no scavenged regeneration
bg_par_scav_fremin=0.0
# return POFe
bg_ctrl_bio_NO_fsedFe=.false.
# Variable Fe:C
bg_ctrl_bio_red_fixedFetoC=.false.
# adjust pK'(FeL)
bg_par_K_FeL_pP=11.0
#(max) C/Fe organic matter ratio
bg_par_bio_red_POFe_POC=250000.0
#[FeT] dependent Fe:C ratio [Ridgwell, 2001] -- power
bg_par_bio_FetoC_pP=-0.4225
#[FeT] dependent Fe:C ratio [Ridgwell, 2001] -- scaling
bg_par_bio_FetoC_K=103684.0
#[FeT] dependent Fe:C ratio [Ridgwell, 2001] -- constant
bg_par_bio_FetoC_C=0.0
#
# --- DATA SAVING -----------------------------------------------------
#
bg_par_data_save_level=99 #malod
bg_ctrl_debug_lvl0=.true.
ma_debug_loop=1
#
# --- FORCINGS ------------------------------------------------------
#
# specify forcings
bg_par_forcing_name="malod.worjh2.FeMahowald2006.no_rest" #malod
bg_par_atm_force_scale_val_3=278.0E-06
bg_par_atm_force_scale_val_4=0
# 2D albedo profile:
ea_par_albedo1d_name=malod_albs_LGM.dat
# scaling for atmospheric CO2 radiative forcing, relative to 278 ppm:
ea_radfor_scl_co2=0.6655
#
# --- MISC -----------------------------------------------------
#
bg_ctrl_bio_preformed=.true.
#
# --- END -----------------------------------------------------------
#
#
