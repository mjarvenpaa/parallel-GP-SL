## Brief introduction to the paper 'Parallel Gaussian process surrogate Bayesian inference with noisy likelihood evaluations'

The paper proposes a coherent **Gaussian process surrogate-based framework** for approximate Bayesian inference when only a limited number of likelihood evaluations are available due to high computational cost. The evaluations can also be noisy which is often the case e.g. in **likelihood-free inference** (LFI) methods such as **approximate Bayesian computation** (ABC) where the likelihood function is itself estimated from the forward simulations of the model.

The paper especially studies theoretically sound adaptive design of batches of the evaluation locations where to run the simulation model to make the inference algorithm as sample-efficient as possible -- this is very important when the simulations are expensive. The proposed method is motivated by recent literature of the related problem of **batch Bayesian optimisation** where -- however -- the goal is to optimise an expensive black-box function while in our Bayesian inference setting we are mainly interested in learning the whole posterior distribution.

While the focus of the paper is on LFI (**synthetic likelihood** method is used as a particular example), the proposed methodology can be used more generally -- whenever expensive and potentially noisy evaluations of the likelihood function or some other target density can only be computed. For more details, please see the paper <https://arxiv.org/abs/1905.01252>.

## MATLAB code

This repository contains an implementation of the inference algorithm used in the paper <https://arxiv.org/abs/1905.01252>. Also scripts for drawing all the illustrative figures in the paper are provided. The implementation contains also some extra features not used in the paper (e.g. alternative optimisation methods of the design criteria) which are, however, not carefully tested.

Note that the implementation is provided mainly to demonstrate the promise of the method with simulation models that are realistic, yet relatively fast to simulate, so that reasonable baselines are available for careful assessment of the estimation accuracy. The code implementation should not be considered as mature, easy-to-use inference software in its current version. To use the proposed method with truly costly simulation models, proper parallellisation needs to be implemented.

## Getting started

Check out and run the file `test_main_code`. The files in the main folder starting with `demo_` can be used to draw the figures of the paper and additional illustrations.

## Installation and external code

Place the code files to your working directory and make sure that all the subfolders are contained in the MATLAB search path. The list below contains links to some external software/code needed. Just obtain these code packages and place them to the working directory.

* GPstuff (used e.g. for MAP estimation of the GP hyperparameters): <https://github.com/gpstuff-dev/gpstuff>
* DRAM MCMC (needed for sampling): <http://helios.fmi.fi/~lainema/dram/>
* g-and-k and cell biology models: <https://github.com/cdrovandi/Bayesian-Synthetic-Likelihood>
* Lorenz model: code can be obtained from the authors on request
* `export_fig` (needed for saving some figures nicely): <https://github.com/altmany/export_fig>
* `subtightplot` (needed for plotting some figures nicely): <https://se.mathworks.com/matlabcentral/fileexchange/39664-subtightplot>
* `shadedplot` (needed for plotting some figures nicely): <https://se.mathworks.com/matlabcentral/fileexchange/18738-shaded-area-plot>

Important: DRAM package contains a file `mad.m` which should not shadow the MATLAB file with the same name, otherwise an error occurs. One thus needs to rename (or remove) `mad.m` contained in the DRAM or ensure otherwise that MATLABs `mad.m` is always called.

If you want to try DIRECT or CMAES algorithms for optimising the design criteria you can obtain implementations from <https://github.com/npinto/direct> and <http://cma.gforge.inria.fr/> or from the author on request.

## Ideas for possible extensions/improvements

* Include support for the LFIRE method introduced in the paper "Likelihood-free inference by ratio estimation" <https://arxiv.org/abs/1611.10242>
* The current implementation is designed mainly for the LFI set-up where one has access to noisy log-likelihood evaluations via the synthetic likelihood method. However, the proposed method also works (possibly after some minimal changes to the GP model) in scenarios where one has access to exact -- but potentially expensive -- black-box likelihood evaluations. The performance of the proposed design criteria (aka acquisition functions) could be investigated in this setting.
* While the computation time of the design criteria is negligible as compared to the usual run-times of many real-world simulation models for which the methodology is particularly useful, approaches for more efficient design of simulation locations could be investigated. The main challenge is that IMIQR and EIV require integration over the parameter space which cannot be calculated analytically.
* The log-likelihood function can become very small or behave non-smoothly near the boundaries of the parameter space of some simulation models. This can cause challenges in GP fitting. Principled ways to avoid such challenges could be investigated. Similarly, models with high-dimensional parameter space can be challenging for the algorithm.

## Support

If you have questions or would like to use the provided implementation or methodology for your own inference problem, please contact <m.j.jarvenpaa@medisin.uio.no> or <jarvenpaamj@gmail.com>.

## License

This software is distributed under the GNU General Public Licence (version 3 or later); please refer to the file LICENSE.txt for details.
