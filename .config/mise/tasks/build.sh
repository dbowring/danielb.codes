#!/bin/bash

exec docker compose up -d --force-recreate --build --pull=always
