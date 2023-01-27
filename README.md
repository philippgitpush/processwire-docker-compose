# ProcessWire Docker Compose
ProcessWire LAMP Server with Docker Compose.

Made to quickly set up a test environment for the [ProcessWire CMS](https://github.com/processwire/processwire), but should also be suitable for use in production. This includes all the libraries and php extensions that ProcessWire needs to work properly.

If you develop on Windows and go into production on Linux, the case of the database tables will not match. You need to export the database from Windows via phpmyadmin and then import it on the production machine and vice versa.

You **must** bind the mysql port to 127.0.0.1 (Windows) or 172.17.0.1 (Linux) if you are working in production, otherwise the port will be accessible to the public with a weak password. The commented out bindings can be found in the `docker-compose.yml` file.

For this, you need to download the [latest version or dev build](https://processwire.com/download/core/) of ProcessWire and unzip it into the `html` folder created by docker-compose.

## Services
- `php:8.1-apache`
  - Ports
    - 80:80
- `mysql:latest`
  - Ports
    - 3306:3306
  - Environment
    - MYSQL_ROOT_PASSWORD=docker
    - MYSQL_PASSWORD=docker
    - MYSQL_USER=docker
    - MYSQL_DATABASE=docker
- `phpmyadmin/phpmyadmin:latest`
  - Ports
    - 8080:80
   - Environment
      - PMA_ARBITRARY=1
      - PMA_HOST=mysql
