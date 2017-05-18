# Docker

```
$ sudo docker-compose up --build
```
or

```
$ sudo docker-compose build
$ sudo docker-compose up
```

# Vendors

```
$ sudo docker-compose exec php composer install
```

## Parameters

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

# Access

```
$ sudo docker-compose exec nginx bash
$ sudo docker-compose exec php bash
```

```
http://localhost:8086
```

# Links

* https://github.com/maxpou/docker-symfony
* https://www.symfony.fi/entry/consider-docker-for-your-symfony-projects
* https://github.com/janit/docker.sf
* https://github.com/eko/docker-symfony
* https://hub.docker.com/r/mroca/symfony-dev/
* https://devhub.io/repos/sskorc-docker-symfony
* https://github.com/sskorc/docker-symfony

