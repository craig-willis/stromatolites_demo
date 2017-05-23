#!/bin/bash


cp -r /stromatolites_demo /workspace/
cd /workspace/stromatolites_demo/

sed -i s/POSTGRES_USER/$POSTGRES_USER/g credentials
sed -i s/POSTGRES_PORT/$POSTGRES_SERVICE_PORT_5432_PORT/g credentials
sed -i s/POSTGRES_HOST/$POSTGRES_SERVICE_PORT_5432_ADDR/g credentials
sed -i s/POSTGRES_DB/$POSTGRES_DB/g credentials
sed -i s/POSTGRES_PASSWORD/$POSTGRES_PASSWORD/g credentials

make local_setup

nodejs /cloud9/server.js -p 80 -w /workspace
