#!/usr/bin/env bash

# install repo for mongodb
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list

# update repositories
sudo apt-get update
echo 'Update complete'

# Nodejs installation
sudo apt-get install nodejs npm git -y && sudo ln -s /usr/bin/nodejs /usr/bin/node

sudo echo 'prefix = /home/vagrant/.node' >> /home/vagrant/.npmrc
source /home/vagrant/.npmrc
sudo echo 'PATH="$PATH:$HOME/.node/bin"' >> /home/vagrant/.bashrc
source /home/vagrant/.bashrc
node -v
echo 'Finished installing node'
npm -v
echo 'Finished installing npm'

# install node modules; mean pre-reqs
npm install -g grunt-cli && npm install -g bower
npm install -g gulp
npm install -g yo
echo 'Finished installing node modules'

# configure permissions
sudo chown -R `vagrant` ~/.npm
sudo chown -R `vagrant` /usr/local

# install ruby and sass

# configure permissions
sudo chown -R `vagrant` ~/.npm
sudo chown -R `vagrant` /usr/local

# install dependencies
sudo apt-get install libx11-dev build-essential zlib1g-dev curl git-core sqlite3 libsqlite3-dev libssl-dev -y

# install rvm to manage ruby
gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
\curl -sSL https://get.rvm.io | sudo bash -s stable
source /etc/profile

# check that install is successful
type rvm | head -n 1

# install and set default ruby version
rvm install 2.1.0
rvm --default 2.1.0
rvm use 2.1.0

# gems
gem install sass

# install yeoman
npm install -g yo
echo 'Finished installing node modules'

# Angularjs installation

npm install -g generator-angular
npm install -g generator-gulp-angular
npm install -g generator-angular-fullstack
npm install -g git://github.com/djskinner/mean-cli.git
echo 'Angularjs installation complete'

# install mongodb
sudo apt-get install -y mongodb-org
echo 'Finished installing Mongodb'

# Neo4j installation

### install java first
#sudo apt-get install python-software-properties
#sudo add-apt-repository ppa:webupd8team/java
#sudo apt-get update
#sudo apt-get -y --force-yes install oracle-java7-installer

wget -O - http://debian.neo4j.org/neotechnology.gpg.key | sudo apt-key add -
sudo echo 'deb http://debian.neo4j.org/repo stable/' | sudo tee --append /etc/apt/sources.list.d/neo4j.list
sudo apt-get update
sudo apt-get -y install neo4j

# check install
service neo4j-service status

echo 'Neo4j installation complete'

# manually make the following changes:
# sudo vi /etc/neo4j/neo4j-server.properties
# org.neo4j.server.webserver.address=0.0.0.0
# sudo service neo4j-service restart
