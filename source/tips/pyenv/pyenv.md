1. Install homebrew for Mac if you don’t have it.


/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" 

2. Install pyenv using homebrew:


brew update
brew install pyenv
brew install pyenv-virtualenv
brew install pyenv-virtualenvwrapper
 

3. Let’s configure Pyenv correctly in your terminal’s ~/.bash_profile (~/.bashrc on Ubuntu). Add the following lines if not already there in the file:


# Python from pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
pyenv virtualenvwrapper



4. After installing the prerequisites, now we’ll use pyenv to install Python. Please choose one of the following steps to follow, depending on which Python you wish to install. Also, if you are using certain packages such as bcrypt, use the alternative install steps.

Regular install steps for Python 2.7.



# Python 2
pyenv install 2.7.10
pyenv global 2.7.10
Steps for installing Python with bcrypt package (see bug report).



# Python 2
PYTHON_CONFIGURE_OPTS="--enable-unicode=ucs2" pyenv install 2.7.10
pyenv global 2.7.10
Regular install steps for Python 3.5.



# Python 3
pyenv install 3.5.1
pyenv global 3.5.1
 

5. To configure virtual environments for project-specific Python dependencies:



mkvirtualenv <your env name>
workon <your env name>
 
# … Do your work ...
 
source deactivate
