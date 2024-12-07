#!/bin/bash

TEMPLATE_DIR="TPC-DS-Tool/DSGen-software-code-3.2.0rc1/query_templates/"

OUTPUT_DIR="TPC-DS-Tool/DSGen-software-code-3.2.0rc1/sql_from_tpl/"

TOOLS_DIR="TPC-DS-Tool/DSGen-software-code-3.2.0rc1/tools/"

mkdir -p $OUTPUT_DIR

cd $TOOLS_DIR

for tpl in $TEMPLATE_DIR/*.tpl; do
  query_name=$(basename $tpl .tpl) 
  ./dsqgen \
  -DIRECTORY $TEMPLATE_DIR \
  -INPUT $query_name.tpl \
  -OUTPUT $OUTPUT_DIR/$query_name.sql \
  -SCALE 1 \
  -QUALIFY N
done
