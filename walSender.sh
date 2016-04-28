#!/bin/bash
# Copiando archivos al standby1 remoto
rsync -q $1 postgres@IP:/var/lib/postgresql/9.5/main/walFilesMaster/$2
