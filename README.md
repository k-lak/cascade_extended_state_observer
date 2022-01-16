# Cascade Extended State Observer (CESO)

This MATLAB/Simulink program contains the implementation of an active disturbance rejection control (ADRC) scheme with a cascade extended state observer (CESO) architecture. The CESO architecture is especially effective in control applications with output measurement noise. 

Stay updated with the latest literature on the ADRC-CESO by following our project on [ResearchGate](https://www.researchgate.net/project/Cascade-Extended-State-Observer-CESO-towards-reducing-noise-amplification-in-ADRC).

Are you new to ADRC? Check out our [ADRC Toolbox](https://www.mathworks.com/matlabcentral/fileexchange/102249-active-disturbance-rejection-control-adrc-toolbox) for MATLAB/Simulink.

## Overview
The goal of this program is to provide an intuitive control solution for MATLAB/Simulink, allowing the implementation of the ADRC algorithm with CESO quickly and with low effort. It is compatible with MATLAB releases R2018b and later.

Two papers describing detailed information about the developed ADRC-CESO algorithm can be found in the [First paper](https://www.sciencedirect.com/science/article/pii/S0019057820303815) (2021) and the [Second paper](https://ieeexplore.ieee.org/document/9345372) (2022). When you use this program in your scientific papers, school reports, etc., please make sure to cite them - see BibTex information in the "References" section below. Thanks! 

## Installation

All files related to the program, including code, data, and examples, are conveniently packaged into a single *.zip file, which can be downloaded by clicking Download --> ZIP.

## How to use
1. Select initial parameters in the script files in folder `init_procedures`.
2. Run initialization script `init.m` from the main folder.
3. To simulate and plot the results, run script `performSingleSimulation.m` from the folder `simulation_procedures`. 

## Code contributors
- [Krzysztof Lakomy](https://scholar.google.com/citations?user=c9JRJywAAAAJ&hl=ja)
- [Rafal Madonski](https://scholar.google.com/citations?user=5a1r0JUAAAAJ&hl=it)

## Contact
adrc.toolbox(at)gmail.com

## References

```code
@article{CESOisat,
	author = {Krzysztof Łakomy and Rafal Madonski}
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
	author = {Łakomy, Krzysztof and Madonski, Rafal and Dai, Bin and Yang, Jun and Kicki, Piotr and Ansari, Maral and Li, Shihua},  
	journal = {IEEE Transactions on Industrial Electronics},   
	title = {Active Disturbance Rejection Control Design With Suppression of Sensor Noise Effects in Application to DC–DC Buck Power Converter},   
	year = {2022},
	volume = {69},  
	number = {1},  
	pages = {816-824},  
	doi = {10.1109/TIE.2021.3055187}
	url = {https://ieeexplore.ieee.org/document/9345372},
}
```   

## License
[MIT](https://choosealicense.com/licenses/mit/)
