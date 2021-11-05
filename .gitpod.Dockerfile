FROM gitpod/workspace-full

USER gitpod

# update python env
ENV PYTHON_VERSION=3.10.0
RUN pyenv update
RUN pyenv install $PYTHON_VERSION && pyenv global $PYTHON_VERSION

RUN pip install --upgrade pip
RUN pip install --upgrade tox virtualenv setuptools pre-commit
