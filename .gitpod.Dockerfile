FROM gitpod/workspace-full

USER gitpod

# update python env
ENV PYTHON_VERSION=3.9.7
RUN pyenv update
RUN pyenv install $PYTHON_VERSION && pyenv global $PYTHON_VERSION

RUN pip install --upgrade pip
RUN pip install --upgrade tox virtualenv setuptools pre-commit

# remove PIP_USER environment
# https://github.com/gitpod-io/gitpod/issues/1997
# https://github.com/gitpod-io/gitpod/issues/4886
RUN if ! grep -q "export PIP_USER=no" "$HOME/.bashrc"; then printf '%s\n' "export PIP_USER=no" >> "$HOME/.bashrc"; fi
