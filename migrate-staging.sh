#!/usr/bin/env bash
OSM_SEED_VERSION=0.1.0-n807.hc1acb2f
cat values.template.yaml | envsubst > values.yaml
helm upgrade --install migration https://devseed.com/osm-seed-chart/osm-seed-${OSM_SEED_VERSION}.tgz -f values.yaml
