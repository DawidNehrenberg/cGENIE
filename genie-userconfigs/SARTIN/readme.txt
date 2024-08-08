################################################################
### readme.txt #################################################
################################################################

Modified from:
'Temperature controls carbon cycling and biological evolution in the ocean twilight zone'
Flavia Boscolo-Galazzo, Katherine A. Crichton, Andy Ridgwell, Elaine M. Mawbey, Bridget S. Wade, Paul N. Pearson

cGENIE userconfig files modified from the above paper.

The existing spinups for each time-interval (0, 2.5, 4.5, 7.5, 10, 12.5, 15 Ma) have been modified to create ten configurations each.
These include two series as per the original paper (with and without a temperature-dependent biological component). 
The five configs per spinup in each series include atmospheric CO2 concentrations set to multiples of the preindustrial level (0.5x, 1x, 2x, 4x, 8x PAL)

./runmuffin-to-go-w-reciept.sh as30g20@soton.ac.uk muffin.CB.umQ00p0a.BASES.colr9 SARTIN 0Ma_Tdep_140_0.2.SPIN 10000; sleep 300; ./runmuffin-to-go-w-reciept.sh as30g20@soton.ac.uk muffin.CB.umQ00p0a.BASES SARTIN 0Ma_Tdep_280_0.2.SPIN 10000; sleep 300; ./runmuffin-to-go-w-reciept.sh as30g20@soton.ac.uk muffin.CB.umQ00p0a.BASES SARTIN 0Ma_Tdep_560_0.2.SPIN 10000; sleep 300; ./runmuffin-to-go-w-reciept.sh as30g20@soton.ac.uk muffin.CB.umQ00p0a.BASES SARTIN 0Ma_Tdep_1120_0.2.SPIN 10000; sleep 300; ./runmuffin-to-go-w-reciept.sh as30g20@soton.ac.uk muffin.CB.umQ00p0a.BASES SARTIN 0Ma_Tdep_2240_0.2.SPIN 10000
