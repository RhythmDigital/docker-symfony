# Isolated Symfony 3.2 environment

Application image is built with multiple Docker containers.

Containers:

* Nginx
* PHP
* MySQL

Tools:

* Composer
* Bower
* Grunt

# Build the project

## Git

Checkout Git repository:

```
$ git clone https://github.com/zoeller/docker-symfony.git
```

## Docker

Pull needed images and start the containers:

```
$ sudo docker-compose up --build
```

or

```
$ sudo docker-compose build
$ sudo docker-compose up
```

or

```
$ sudo docker-compose build
$ sudo docker-compose up
```

## Parameters

Setup Symfony parameters:

Copy ```app/config/parameters.yml.dist``` to ```app/config/parameters.yml``` and edit the parameters in there.

```
$ cp app/config/parameters.yml.dist app/config/parameters.yml
$ vim app/config/parameters.yml
```

Or alternatively enter parameters later during ```composer install```.

```
Creating the "app/config/parameters.yml" file
Some parameters are missing. Please provide them.
database_host (127.0.0.1): 
database_port (null): 
database_name (symfony): 
database_user (root): symfony
database_password (null): symfony
mailer_transport (smtp): 
mailer_host (127.0.0.1): 
mailer_user (null): 
mailer_password (null): 
secret (ThisTokenIsNotSoSecretChangeIt): 
```

## Vendors and Tools

Run

```
$ sudo docker-compose exec php bash dev/init_php.sh
```

or each command separately:

```
$ sudo docker-compose exec php composer install
$ sudo docker-compose exec php npm install -g bower
$ sudo docker-compose exec php npm install -g grunt-cli
$ sudo docker-compose exec php bower install --allow-root
$ sudo docker-compose exec php npm install
$ sudo docker-compose exec php grunt
$ sudo docker-compose exec php chown -R www-root:1000 web/_static
```

# Xdebug

* Set the same __server name__ in ```docker-compose.yml``` and PhpStorm settings.
* Set the debug port e.g. to __10000__

## docker-compose.yml

```
php:
    environment:
      XDEBUG_CONFIG: "remote_host=172.17.0.1"
      PHP_IDE_CONFIG: "serverName=docker-php"
```

## docker/php/Dockerfile

```
RUN docker-php-ext-enable xdebug \
    && echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.idekey=PHPSTORM" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=1" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_host=localhost" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_port=10000" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_connect_back=0" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_log=/var/log/xdebug.log" >> /usr/local/etc/php/conf.d/xdebug.ini
```

## PhpStorm settings

(For current project)

### Languages & Frameworks > PHP > Debug

* Debug port: 10000
* Check "Can accept external connections"

### Languages & Frameworks > PHP > Servers

Add a server with properties:

* Name: docker-php
* Host: localhost
* Port: 80
* Debugger: Xdebug
* Check "Use path mappings
* Path setting:
  * File/Directory: /home/dev/docker-symfony-repo
  * Absolute path on the server: /var/www

# Access

## Symfony default page


```
http://localhost:8086
```

## Docker containers

```
$ sudo docker-compose exec php bash
$ sudo docker-compose exec mysql bash
$ sudo docker-compose exec nginx bash
```

# Useful commands

```
$ sudo docker stats
$ sudo docker-compose down
$ sudo docker-compose down --volumes
$ sudo docker rm $(sudo docker ps -aq)
$ sudo docker rmi $(sudo docker images -q)
$ sudo docker rmi -f $(sudo docker images -q)
$ sudo docker kill $(sudo docker ps -qa)
```

# Links

* https://github.com/maxpou/docker-symfony
* https://www.symfony.fi/entry/consider-docker-for-your-symfony-projects
* https://github.com/janit/docker.sf
* https://github.com/eko/docker-symfony
* https://hub.docker.com/r/mroca/symfony-dev/
* https://devhub.io/repos/sskorc-docker-symfony
* https://github.com/sskorc/docker-symfony
* https://github.com/kbond/symfony-grunt-edition
* https://sandro-keil.de/blog/2015/10/05/docker-php-xdebug-cli-debugging/