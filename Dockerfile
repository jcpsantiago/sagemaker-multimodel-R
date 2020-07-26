FROM rocker/r-ver:4.0.0 

MAINTAINER Joao Santiago <joaocpsantiago@gmail.com>

RUN apt-get update && apt-get install -y --no-install-recommends \
      #needed for git2r
      libssl-dev \
      zlib1g-dev \
      # needed for curl
      libcurl4-openssl-dev && \
    apt-get clean -y && rm -rf /var/lib/apt/lists/*

RUN install2.r -e remotes xgboost plumber

COPY . /tmp/pkg
RUN R CMD build /tmp/pkg

# install the package
RUN mv *.tar.gz sagemakermultimodel.tar.gz
RUN R -e 'install.packages("sagemakermultimodel.tar.gz", repos = NULL, type = "source")' &&\
  rm -rf /tmp/pkg
  
# needed when using the container as part of a Sagemaker pipeline
LABEL com.amazonaws.sagemaker.capabilities.accept-bind-to-port=true
LABEL com.amazonaws.sagemaker.capabilities.multi-models=true

COPY start_api.R /opt/ml/start_api.R

ENTRYPOINT ["Rscript", "/opt/ml/start_api.R", "--no-save"]
