#!/usr/bin/env bash
OSM_SEED_VERSION=0.1.0-n787.h2a19af9
cat values.template.yaml | envsubst > values.yaml
helm upgrade --install migration https://devseed.com/osm-seed-chart/osm-seed-${OSM_SEED_VERSION}.tgz -f values.yaml
