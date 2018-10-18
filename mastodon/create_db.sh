#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $(readlink -f $0 || echo $0));pwd -P)
sqlite3 ${SCRIPT_DIR}/stored.db ".read ${SCRIPT_DIR}/create_instances_table.sql"

