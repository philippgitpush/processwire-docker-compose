# ProcessWire Docker Compose
ProcessWire LAMP Server with Docker Compose.

Made to quickly set up a test environment for the [ProcessWire CMS](https://github.com/processwire/processwire), but should also be suitable for use in production.

## Services
- `php:7.4-apache`
  - IPv4 & Ports
    - `172.18.0.2`, 80:80
- `mariadb:latest`
  - IPv4 & Ports
    - `172.18.0.3`, 3306:3306
  - Environment
    - MYSQL_ROOT_PASSWORD=docker
    - MYSQL_PASSWORD=docker
    - MYSQL_USER=docker
    - MYSQL_DATABASE=docker
- `phpmyadmin/phpmyadmin:latest`
  - IPv4 & Ports
    - `172.18.0.4`, 8080:80
   - Environment
      - PMA_ARBITRARY=1
      - PMA_HOST=mariadb
    
## Networks
- `lamp-network`
  - subnet: `172.18.0.0/16`
  - gateway: `172.18.0.1`