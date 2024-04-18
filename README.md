# OpenHistoricalMap DB migration

This is a script for performing the database migration of the Web API using Helm, and basic configurations to carry out the migration


Requirements:

- Access to AWS OHM account
- Access to the staging and production clusters


## Export environment values

```sh
export AWS_AVAILABILITY_ZONE=us-east-1a
export ENVIROMENT=staging
export EBS_DISK_SIZE=200
export POSTGRES_DB=db
export POSTGRES_PASSWORD=abc
export POSTGRES_USER=user
export PGUSER=user
export RESTORE_URL_FILE="https://osm-seed.sql.gz"
```

## Creating the EBS disk

```sh
aws ec2 create-volume \
    --volume-type gp2 \
    --size $EBS_DISK_SIZE \
    --availability-zone $AWS_AVAILABILITY_ZONE \
    --tag-specifications \
    "ResourceType=volume,Tags=[{Key=Enviroment,Value=$ENVIROMENT},{Key=Name,Value=osmseed-$ENVIROMENT-api-web-db}]"
```
