FROM node:latest

#RUN useradd --user-group --create-home --shell /bin/false app &&\
#  npm install --global npm@3.7.5

ENV USER=node
ENV HOME=/home/$USER

RUN mkdir -p /home/$USER \
  && chown -R $USER $HOME \
  && chgrp -R $USER $HOME

USER $USER

WORKDIR $HOME/authapp
VOLUME ["/home/$USER/authapp", "/docker"]

#CMD ["/bin/bash"]
CMD ["echo", "ready"]
