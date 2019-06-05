Readme
======

## MATLAB code for the paper 'Parallel Gaussian process surrogate method to accelerate likelihood-free inference'

This repository contains a simple implementation of the proposed inference algorithm in the above paper preprint of which is available in <https://arxiv.org/abs/1905.01252>. Also scripts for drawing the illustrative figures in the paper are provided. The imnplementation contains also some extra features (e.g. alternative optimisation methods of the design criteria) which are - however - not carefully tested. Functions for replicating the experiments are not provided here as these need to be run on a computer cluster. 

Note that this implementation is provided mainly to show that the method works well in 'academic example cases' which are relatively fast to simulate. To use the proposed method in a real-world scenarios it might be necessary to reimplement it to a computer cluster environment to take the advantage of the parallel computing. For this purpose, a python implementation to the software package ELFI (<https://github.com/elfi-dev/elfi>) is being planned. 

## Getting started

Check out and then run the file `test_main_code()`. The files in the main folder starting with `demo_` can be used to draw the figures of the paper and for some further illustrations.

## Installation and external code

Place the code files to your working folder and make sure that all the subfolders are contained in the MATLAB search path. The list below contains links to some external software/code that is not included to this repo but is necessary for some features. Just obtain these code packages and place them to the working directory.

* GPstuff (some GPstuff functions are needed for e.g. MAP estimation of the GP hyperparameters): <https://github.com/gpstuff-dev/gpstuff>
* DRAM MCMC (needed for sampling): <http://helios.fmi.fi/~lainema/dram/>
* g-and-k and cell biology models: <https://github.com/cdrovandi/Bayesian-Synthetic-Likelihood>
* Lorenz model: code can be obtained from the authors on request
* `export_fig` (needed for saving some figures nicely): <https://github.com/altmany/export_fig>
* `subtightplot` (needed for plotting some figures nicely): <https://se.mathworks.com/matlabcentral/fileexchange/39664-subtightplot>
* `shadedplot` (needed for plotting some figures nicely): <https://se.mathworks.com/matlabcentral/fileexchange/18738-shaded-area-plot>

Important: DRAM package contains a file `mad.m` which should not shadow the MATLAB file with the same name, otherwise an error occurs. One thus needs to rename (or remove) `mad.m` contained in the DRAM or ensure otherwise that MATLABs `mad.m` is always called. 

If you want to use DIRECT or CMAES algorithms for optimising the design criteria you can obtain implementations from <https://github.com/npinto/direct> and <http://cma.gforge.inria.fr/> or from the author on request.

## Ideas for possible extensions/improvements

* Include support for LFIRE method proposed in the paper Likelihood-free inference by ratio estimation <https://arxiv.org/abs/1611.10242>
* The current implementation is designed mainly for the likelihood-free inference set-up where one has access only to noisy log-likelihood evaluations via the synthetic likelihood method. However, the proposed method should also work (possibly after some minor changes to the GP model) in scenarios where one has access to exact - but potentially expensive - black-box likelihood evaluations. The performance of the proposed design criteria (aka acquisition functions) could be investigated in this setting. 
* While the computation time of the design criteria is negligible as compared to the usual run-times of many real-world simulation models for which the methodology is particularly useful, approaches for more efficient design of simulation locations could be investigated. The main challenge is that IMIQR and EIV require integration over the parameter space which cannot be calculated analytically. 

## Support

If you have questions or would like to use the provided implementation or methodology for your own inference problem, please contact <marko.j.jarvenpaa@aalto.fi>

## Licence

This software is distributed under the GNU General Public Licence (version 3 or later); please refer to the file Licence.txt for details.

