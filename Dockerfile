FROM continuumio/miniconda3:4.12.0

LABEL "repository"="https://github.com/tethysapp/conda-package-publish-action"
LABEL "maintainer"="Michael Souffront <msouffront@aquaveo.com>"

RUN conda install -y anaconda-client
RUN conda install -y -c conda-forge conda-build

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
