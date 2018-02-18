FROM node:4.3.2

RUN useradd --user-group --create-home --shell /bin/false app &&\
  npm install --global npm@3.7.5

ENV HOME=/home/app

COPY app/*.* $HOME/authapp/
RUN chown -R app:app $HOME/*

USER app

RUN true \
  && echo 'alias ll="ls -l"' >> $HOME/.bashrc \
  && echo 'alias la="ls -la"' >> $HOME/.bashrc 
  
WORKDIR $HOME/authapp

RUN npm install 

CMD ["node", "server.js"]
