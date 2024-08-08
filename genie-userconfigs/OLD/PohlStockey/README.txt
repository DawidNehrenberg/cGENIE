Configs based on Pohl et al. SciAdv. 2023 using the following  user Configs
AP.0__ebP2_.bg.PO4.Tdep.pCO2FKr_x0.5.PO4PD.pO2PD_radfor
AP.20_ebP2_.bg.PO4.Tdep.pCO2FKr_x0.5.PO4PD.pO2PD_radfor
AP.40_ebP2_.bg.PO4.Tdep.pCO2FKr_x0.5.PO4PD.pO2PD_radfor
AP.60_ebP2_.bg.PO4.Tdep.pCO2FKr_x0.5.PO4PD.pO2PD_radfor

Commands to run to create runs
./runmuffin.sh muffin.AP.0__ebP2_.eb_go_gs_ac_bg.PO4.SPIN PohlStockey/DN.00_140pCO2.SPIN 10000
./runmuffin.sh muffin.AP.0__ebP2_.eb_go_gs_ac_bg.PO4.SPIN PohlStockey/DN.00_190pCO2.SPIN 10000
./runmuffin.sh muffin.AP.0__ebP2_.eb_go_gs_ac_bg.PO4.SPIN PohlStockey/DN.00_278pCO2.SPIN 10000

./runmuffin-to-go-w-receipt.sh dn3g22@soton.ac.uk muffin.AP.0__ebP2_.eb_go_gs_ac_bg.PO4.SPIN PohlStockey DN.00_140pCO2.SPIN 10000; sleep 360; ./runmuffin-to-go-w-receipt.sh dn3g22@soton.ac.uk muffin.AP.0__ebP2_.eb_go_gs_ac_bg.PO4.SPIN PohlStockey DN.00_190pCO2.SPIN 10000; sleep 360; ./runmuffin-to-go-w-receipt.sh dn3g22@soton.ac.uk muffin.AP.0__ebP2_.eb_go_gs_ac_bg.PO4.SPIN PohlStockey DN.00_278pCO2.SPIN 10000
./runmuffin-to-go-w-receipt.sh dn3g22@soton.ac.uk muffin.AP.0__ebP2_.eb_go_gs_ac_bg.PO4.SPIN PohlStockey DN.20_140PCO2.SPIN 10000; sleep 360; ./runmuffin-to-go-w-receipt.sh dn3g22@soton.ac.uk muffin.AP.0__ebP2_.eb_go_gs_ac_bg.PO4.SPIN PohlStockey DN.20_190PCO2.SPIN 10000; sleep 360; ./runmuffin-to-go-w-receipt.sh dn3g22@soton.ac.uk muffin.AP.0__ebP2_.eb_go_gs_ac_bg.PO4.SPIN PohlStockey DN.20_278PCO2.SPIN 10000