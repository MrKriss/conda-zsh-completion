# conda-auto-env automatically activates a conda environment when
# entering a folder with an environment.yml file.
#
# If the environment doesn't exist, conda-auto-env will ask if 
# it should create and activate it for you.
#
# Extended from: https://github.com/chdoig/conda-auto-env/blob/master/conda_auto_env.sh 

function conda_auto_env() {
  if [ -e "environment.yml" ]; then
    echo "environment.yml file found"
    ENV=$(head -n 1 environment.yml | cut -f2 -d ' ')
    # Check if you are already in the environment
    if [[ $PATH != *$ENV* ]]; then
      # Check if the environment exists
      source activate $ENV
      if [ $? -eq 0 ]; then
        :
      else
        # Ask to create the environment and activate
        echo "Conda env '$ENV' doesn't exist."
        echo -n "Install and activate $ENV? (y/n)? "
        read answer
        if echo "$answer" | grep -iq "^y" ;then
          conda env create -q
          source activate $ENV
          echo "\nEnvironment $ENV activated"
        fi
      fi
    fi
  fi
}

# Add conda_auto_env to the list of functions called on changing a directory
chpwd_functions=( ${chpwd_functions} conda_auto_env )

# Also add common aliases for switching between conda environments
alias workon='source activate'
alias workoff='source deactivate'

# Add ability to autocomplete environment names after using 
# 'source activate' or the above 'workon' alias  
#  See http://unix.stackexchange.com/questions/177902/zsh-completion-on-the-second-command-or-after-an-alias
compdef _precommand source
