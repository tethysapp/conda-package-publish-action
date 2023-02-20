# FROM continuumio/miniconda3:4.12.0
FROM mambaorg/micromamba:1.3.1


LABEL "repository"="https://github.com/tethysapp/conda-package-publish-action"
LABEL "maintainer"="Michael Souffront <msouffront@aquaveo.com>"

RUN micromamba install -y -n base -c conda-forge -c anaconda boa anaconda-client

# RUN conda install -y anaconda-client
# RUN conda install -y -c conda-forge conda-build

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
