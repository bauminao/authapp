# authapp
I want to have an authentification app to prive against Azure AD or Google.. or whatever. 

# Step 1 -- Getting dockers run
Very near along the example

# Step 2 -- Starting my own nodejs

# complicated things
Arch-linux and docker-compose have problems using Python 3.xxx 
  sudo pip install docker==2.7.0
solved the problem so far.


# Commands:
* docker-compose build
* docker-compuse up
* docker-compose run --rm authapp /bin/bash


# Additional things
* create a self-signed certificate
 openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -nodes -days 365
