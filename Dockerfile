FROM node:latest

#RUN useradd --user-group --create-home --shell /bin/false app &&\
#  npm install --global npm@3.7.5

ENV USER=node
ENV HOME=/home/$USER

COPY app/npm-shrinkwrap.json app/package.json $HOME/authapp/

RUN mkdir -p /home/$USER  \
  && chown -R $USER $HOME \
  && chgrp -R $USER $HOME 

USER $USER

COPY docker_data/userenv/* $HOME

WORKDIR $HOME/authapp

VOLUME ["/home/$USER/authapp", "/docker", "/home/$USER/authapp/node_modules"]

RUN npm install 

CMD ["echo", "ready"]
