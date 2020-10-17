FROM mcr.microsoft.com/quantum/iqsharp-base:0.11.2004.2825

USER root
COPY . ${HOME}
RUN chown -R ${USER} ${HOME}

USER ${USER}
