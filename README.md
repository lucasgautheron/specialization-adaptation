# Balancing Specialization and Adaptation in a Transforming Scientific Landscape

This repository contains the source of the paper "Balancing Specialization and Adaptation in a Transforming Scientific Landscape".

## Installation

The repository relies on DataLad, a git and git-annexed based software for reproducible research and data sharing.
DataLad installation instructions can be found [here](https://handbook.datalad.org/en/latest/intro/installation.html). 

To install the repository and all the dependencies (code and data):

```bash
datalad install -r git@github.com:lucasgautheron/specialization-adaptation.git
```

Please note that the repository contains nested submodules. The above command will install all of them recursively.

## Manuscript compilation

The manuscript can be re-compiled by issuing the following commands:

```bash
make clean
make
```

## Code organization

The code that performs the main analyses can be found in ``specialization_adaptation_material/code''.
The table below describes its organization:

| Script                           	| Function                                                                                                           	| Dependencies                                                                          	|
|----------------------------------	|--------------------------------------------------------------------------------------------------------------------	|---------------------------------------------------------------------------------------	|
| ```code/etm.py```                  	| Learns embeddings and topics.                                                                                      	|                                                                                       	|
| ```code/etm_compile.py```          	| Counts keywords part of each topic within each article using Naives Bayes and the previously trained topic model.  	| ```output/<>/dataset.pickle.py```, ```output/<>/<br>```output/<>/etm_instance.pickle.py``` 	|
| ```code/etm_transfers.py```        	| Evaluates scientists' research portfolios.                                                                         	| ```output/<>/topics_counts.py```                                                        	|
| ```code/authors_sociality.py```    	| Calculates social capital.                                                                                         	| ```output/<>/aggregates.csv```                                                          	|
| ```code/etm_ei.py```               	| Runs the ecological inference model with Stan.                                                                     	| ```output/<>/aggregates.csv```, ```output/<>/pooled_resources.parquet```                  	|
| ```code/etm_map.py```              	| Evaluates the MAP performance of the ecological inference model using K fold cross-validation.                     	| ```output/<>/aggregates.csv```, ```output/<>/pooled_resources.parquet```              	|
| ```code/topic_distance.py```       	| Evaluates "distances" between topics using different metrics.                                                      	| All of the above                                                                      	|
| ```code/optimal_transport.py```    	| Recover migration cost matrix using probabilistic inverse optimal transport.                                       	| All of the above and MCMC samples from the ecological inference model.                	|
| ```code/comparative_analysis.py``` 	| Performs a comparative analysis of the effect of capital on different metrics of change in research interests.     	| All of the above and MCMC samples from the ecological inference model.                	|

The code available under ```specialization_adaptation_material/plots``` produces plots using the output of analyses performed by the above scripts.
