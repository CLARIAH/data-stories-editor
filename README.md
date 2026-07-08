# CLARIAH Data Stories Editor

![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)

## Introduction
The CLARIAH Data Stories Editor is a platform for creating and sharing data stories in a collaboration setting. With this software researchers can share and publish their work, supported by images, video, data visualizations and live data (e.g. data sets can be queried online by the reader).

More text will follow...

## Quick start

### Prerequisite
- Have a running Docker instance

### Installation
Clone this repository to your computer with

`git clone https://github.com/CLARIAH/data-stories-editor`

The easiest way to start your instance of the editor is the single user version. For this version no authentication is needed. It contains a single test user with full control over the test data stories.
The test data is located in the directory `/example/locathost.data`. It contains three data stories and a SQLite database file which contains information about the data stories, users and user rights.

Before running the editor make sure that the variable `DATA_LOCATION`  file `.env.local` contains the full path to the directory `example/localhost.data` on your computer.

After that you can run start the editor with

`docker compose -f docker-compose-local.yml --env-file .env-local up -d`

With the current docker compose file the editor will run at `http://localhost`, default port 80. 