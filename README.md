[![View Cascade extended state observer (CESO) on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/105330-cascade-extended-state-observer-ceso)

# Cascade Extended State Observer (CESO)

This MATLAB/Simulink program contains the implementation of an active disturbance rejection control (ADRC) scheme with an innovative *cascade* extended state observer (CESO) architecture. The CESO architecture is especially effective in control applications contaminated with output measurement noise.

>Are you new to ADRC? Check out our '[ADRC Toolbox](https://www.mathworks.com/matlabcentral/fileexchange/102249-active-disturbance-rejection-control-adrc-toolbox)' for MATLAB/Simulink.

Stay updated with the latest literature on the ADRC-CESO by following our project on [ResearchGate](https://www.researchgate.net/project/Cascade-Extended-State-Observer-CESO-towards-reducing-noise-amplification-in-ADRC).

## Overview
The goal of this program is to provide an intuitive control solution for MATLAB/Simulink, allowing the implementation of the ADRC algorithm with CESO quickly and with low effort. The program also contains the standard ESO as well as higher-order ESO (GPIO) architectures allowing for a direct performance comparison. **The program is compatible with MATLAB releases R2018b and later**.

Two papers describing the detailed information about the developed ADRC-CESO algorithm can be found in [[1]](https://www.sciencedirect.com/science/article/pii/S0019057820303815) (2021) and [[2]](https://ieeexplore.ieee.org/document/9345372) (2022). When you use this program in your scientific papers, school reports, etc., please make sure to cite them. Thank you! 

[[1]](https://www.sciencedirect.com/science/article/pii/S0019057820303815) K. Lakomy, R. Madonski, 'Cascade extended state observer for active disturbance rejection control applications under measurement noise', ISA Transactions, Volume 109, Pages 1-10, 2021, url: https://www.sciencedirect.com/science/article/pii/S0019057820303815

[[2]](https://ieeexplore.ieee.org/document/9345372) K. Lakomy, R. Madonski et al., 'Active Disturbance Rejection Control Design With  Suppression of Sensor Noise Effects in Application to DC???DC Buck Power Converter', IEEE Transactions on Industrial Electronics, vol. 69(1), pp. 816-824, 2022, url: https://ieeexplore.ieee.org/abstract/document/9345372

>Citation information in BibTex format can be found in the 'References' section at the bottom of this page.

## How to download

All files related to the program, including code, data, and examples, are conveniently packaged into a single \*.zip file, which can be downloaded by clicking 'Download' in the top right-hand corner of this website.

## How to use
1. Run initialization script `init.m` from the root folder.
2. Select initial parameters in script files in the `init_procedures` folder.
3. To simulate the selected control system and plot the results, run script `performSingleSimulation.m` from the `simulation_procedures` folder. Alternatively, you can directly run the `ObserverTest.slx` model and see the results by running script `plotData.m`.

### Program tree
```
root
 - controller
 - data
 - init_procedures
 - math
 - observers
 - plant
 - signal_generators
 - simulation_procedures
```

## Code contributors
- [Krzysztof Lakomy](https://scholar.google.com/citations?user=c9JRJywAAAAJ)
- [Rafal Madonski](https://scholar.google.com/citations?user=5a1r0JUAAAAJ&hl=it)

## Contact
adrc.toolbox(at)gmail.com

## References (BibTex format)

```code
@article{CESOisat,
	author = {Krzysztof ??akomy and Rafal Madonski}
	title = {Cascade extended state observer for active disturbance rejection control applications under measurement noise},
	journal = {ISA Transactions},
	volume = {109},
	pages = {1-10},
	year = {2021},
	doi = {10.1016/j.isatra.2020.09.007},
	url = {https://www.sciencedirect.com/science/article/pii/S0019057820303815},
	}
```
```code
@article{CESOtie,  
	author = {??akomy, Krzysztof and Madonski, Rafal and Dai, Bin and Yang, Jun and Kicki, Piotr and Ansari, Maral and Li, Shihua},  
	journal = {IEEE Transactions on Industrial Electronics},   
	title = {Active Disturbance Rejection Control Design With Suppression of Sensor Noise Effects in Application to DC???DC Buck Power Converter},   
	volume = {69},  
	number = {1},  
	pages = {816-824},
	year = {2022},
	doi = {10.1109/TIE.2021.3055187}
	url = {https://ieeexplore.ieee.org/document/9345372},
	}
```   

## License
[MIT](https://choosealicense.com/licenses/mit/)
