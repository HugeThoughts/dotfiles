#!/bin/bash

if [ "$(uname)" == "Darwin" ]; then
	xcode-select –install
    # Install Brew
    ruby -e “$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)”  

    brew install aria2

elif [ "$(uname)" == "Linux" ] && [	"$(lsb_release -si)" == "Ubuntu" ]; then
    
    echo -e "\n--- Add some repos to update our distro ---\n"
    
    sudo add-apt-repository ppa:atareao/telegram
    sudo add-apt-repository ppa:saiarcot895/myppa # apt-fast repo
 
	echo -e "\n--- Updating packages list ---\n"

    sudo apt-get update

    ## Internet
    sudo apt-get -y install apt-fast telegram

    ## Multimedia
    sudo apt-get -y install vlc

    ## System
    sudo apt-get -y install preload xclip zsh terminator

    chsh -s $(which zsh)

    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    ## Dev Tools
 
    sudo apt-get -y  install curl git build-essential



    ## LAMP

    sudo apt-get -y install apache2

	sudo apt-get -y install mysql-server libapache2-mod-auth-mysql php5-mysql libmysqlclient-dev

	sudo apt-get -y install php5 phpmyadmin libapache2-mod-php5 php5-mcrypt php5-curl

	### LAMP Configuration

	echo -e "\n--- Enabling mod-rewrite ---\n"
	
	a2enmod rewrite > /dev/null 2>&1

	echo -e "\n--- Allowing Apache override to all ---\n"
	sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/apache2.conf

	echo -e "\n--- Setting document root to public directory ---\n"
	rm -rf /var/www
	mkdir -p ~/www
	ln -fs ~/www /var/www

	echo -e "\n--- We definitly need to see the PHP errors, turning them on ---\n"
	sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php5/apache2/php.ini
	sed -i "s/display_errors = .*/display_errors = On/" /etc/php5/apache2/php.ini

	echo -e "\n--- Configure Apache to use phpmyadmin ---\n"
	sudo sed -i -e '$a\Include /etc/phpmyadmin/apache.conf' /etc/apache2/apache2.conf

	## Composer

	echo -e "\n--- Installing Composer for PHP package management ---\n"
	curl --silent https://getcomposer.org/installer | php > /dev/null 2>&1
	mv composer.phar /usr/local/bin/composer

	
	## RVM

    \curl https://raw.githubusercontent.com/rvm/rvm/master/binscripts/rvm-installer | bash -s stable --rails

	rvm use 2.2.1

	## NVM

	\curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.26.1/install.sh | bash
	echo '[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh  # This loads NVM' >> ~/.zshrc
	. ~/.zshrc

	nvm install 4.0.0

	nvm alias default 4.0.0

	nvm alias node 4.0.0


	# Installing Node Packages
	npm install -g gulp bower browser-sync live-server harp

	npm install -g yo generator-webapp generator-angular



fi

./symlink-setup.sh
