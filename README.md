# Oh-My-Zsh plugin for conda 

This is my custom pluggin for additional utilities for working with [conda](http://conda.pydata.org/docs/) in Zsh via [Oh My Zsh](http://ohmyz.sh/).

Conda is the open source package management and environment management command line utility that manages the Python distributions offered by [Continuum Analytics](https://www.continuum.io/).  

## Features

Auto-completion for:

* conda commands and subcommands
* current environment names 
* package names to install/remove from an environment
* environment names when using `source activate` or any alias of it

In addition upon entering a directory with an `environment.yml` file, conda will activate the environment if it exists, and ask if you wish to install and activate it if it does not.

Aliases Provided:

* `workon` for `source activate`
* `workoff` for `source deactivate`

## Dependencies 

Currently lookup of the package names requires parsing and iterating over a JSON object, which is done using Python. However as conda itself is written in Python, if you have installed conda you will also have Python. 

The easiest way to install conda is to install the [Miniconda](http://conda.pydata.org/miniconda.html) Python distribution provided by [Continuum Analytics](https://www.continuum.io/).

## Quick Start 

1. Install Miniconda 
2. `git clone https://github.com/MrKriss/conda-zsh-completion`
3. Copy subdirectory to ohmyzsh plugins directroy with `cp -R conda-zsh-completion/conda $ZSH/custom/plugins`
4. Enable `conda` by adding it to the `plugins` variable defined in `~/.zshrc`
5. Restart terminal

### Credits 

This plugin is largely a recombination of existing code written by the following authors:

* [esc](https://github.com/esc/)
* [chdoig](https://github.com/chdoig/)
