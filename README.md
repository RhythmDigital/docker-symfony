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
$ sudo docker rm $(sudo docker ps -aq)
$ sudo docker rmi $(sudo docker images -q)
```

## Shutdown/Clean up

```
$ sudo docker-compose down
$ sudo docker-compose down --volumes
```

# Links

* https://github.com/maxpou/docker-symfony
* https://www.symfony.fi/entry/consider-docker-for-your-symfony-projects
* https://github.com/janit/docker.sf
* https://github.com/eko/docker-symfony
* https://hub.docker.com/r/mroca/symfony-dev/
* https://devhub.io/repos/sskorc-docker-symfony
* https://github.com/sskorc/docker-symfony