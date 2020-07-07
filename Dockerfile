FROM continuumio/miniconda3:4.7.10

LABEL "repository"="https://github.com/rfun/conda-package-publish-action"
LABEL "maintainer"="Rohit Khattar <rohitkhattar11@gmail.com>"

RUN conda install -y anaconda-client conda-build

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
