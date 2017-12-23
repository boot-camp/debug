---
Title: debug
---
# debug
Node.js Live Debugging with Docker and Visual Studio Code

## Quick reference

* Create separate docker-compose.yml for production and development
* add nodemon, debug ports and volume mount

``` yaml
version: '3'

services:
  debug:
    image: debug
    build: .
    environment:
      NODE_ENV: development
    volumes:
      - ${SRC:-./src}:/usr/src/app/
    ports:
      - 8000:8000
      - 5858:5858
    command: nodemon -L --inspect=0.0.0.0:5858 app.js
```

* load the service in windows terminal (path conversion doesn't work in WSL)

``` ps
  docker-compose -f docker-compose.debug.yml up --no-build
```
