#!/bin/env bash
#
# Setup script for MacOS High Sierra
#
set -euxo pipefail

# Homebrew - see https://brew.sh
xcode-select —install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install bash-completion
brew install gettext
brew install ossp-uuid
brew link --force gettext

# Mysql client
brew install caskroom/cask/mysql-shell

# MkDocs
pip install --user mkdocs mkdocs-material

# Node.js and NPM
brew install node

# Java
brew cask install java8
brew install gradle

# SDKMAN
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

# Kubernetes & GCloud
brew cask install virtualbox docker google-cloud-sdk
brew install kubectl minikube kubernetes-helm go glide

# Initialize Minikube and Docker
minikube start
helm init
open "/Applications/Docker.app"

# Setup MacOS Finder
defaults write com.apple.finder AppleShowAllFiles YES
killall Finder

# AWS CLI
sudo easy_install pip
brew install awscli awsebcli

# SSH
ssh-keygen -t rsa -C “yours@example.com" -b 4096

cat >~/.ssh/config <<-EOL
HashKnownHosts yes

Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_rsa

Host gitlab.com
	HostName gitlab.com
	PreferredAuthentications publickey

Host *.amazonaws.com, *.elasticbeanstalk.com
  User ec2-user

EOL

# Tools
brew install jq midnight-commander mysql openssl ruby

# Development apps
brew cask install argouml brackets dbeaver-community macdown mysql-shell teamviewer postman eclipse-java

# Multimedia apps
brew cask install transmission vlc

# Productivity apps
brew cask install google-backup-and-sync google-chrome skype

# Design apps
brew cask install xquartz inkscape

# Git config
brew install git

# git config --global user.name "$DEBFULLNAME"
# git config --global user.email "$DEBEMAIL"
git config --global push.default simple
