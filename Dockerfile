FROM continuumio/miniconda3:23.10.0-1
# FROM mambaorg/micromamba:1.3.1


LABEL "repository"="https://github.com/tethysapp/conda-package-publish-action"
LABEL "maintainer"="Michael Souffront <msouffront@aquaveo.com>"

# RUN micromamba install -y -n base -c conda-forge -c anaconda boa anaconda-client

RUN conda install -y anaconda-client
RUN conda install -y -c conda-forge boa

# RUN conda install -y -c conda-forge conda-build

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
