FROM bioconda/bioconda-builder

RUN conda config --add channels iuc

# setup entrypoint (assuming that repo is mounted under /bioconda-recipes)
ENTRYPOINT ["/bioconda-recipes/scripts/build-packages.py"]
CMD []
