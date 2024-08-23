# About

This is a demo project. A CSV is streamed into a postgres database with postgis and a phoenix endpoint. The front end is React + Leaflet

## Getting started

### Prereqs

Install [Docker](https://www.docker.com/), [asdf](https://asdf-vm.com/), and [npm](https://www.npmjs.com/).

From root:

### `npm install`

Installs Elixir, Erlang, and Node through adsf.
Builds and deploys postgres with postgis in docker.
Installs dependencies for frontend and backend.

### `npm run migrate`

Runs ecto migrations, temporilary starts the application, and streams data from csv to database.

### `npm start`

Starts the front end with logs piped to front_end/ft-demo/client.log.
Starts the backend with terminal logs.

## For Convenience

`npm install && npm run migrate && npm start`
