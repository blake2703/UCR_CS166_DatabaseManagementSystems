#!/bin/bash

echo "Creating sequence..."
cat <(echo 'DROP SEQUENCE IF EXISTS part_number_seq;')|psql -h localhost -p $PGPORT $USER"_DB"
cat <(echo 'CREATE SEQUENCE part_number_seq  START WITH 50000;')|psql -h localhost -p $PGPORT $USER"_DB"

echo "Creating trigger and procedure..."
psql -h localhost -p $PGPORT $USER"_DB" < triggers.sql

echo "Testing insert..."
cat <(echo "Insert into part_nyc(supplier, color, on_hand, descr) Values (0, 0, 20, 'Description')")|psql -h localhost -p $PGPORT $USER"_DB"
cat <(echo "Insert into part_nyc(supplier, color, on_hand, descr) Values (0, 0, 20, 'Description')")|psql -h localhost -p $PGPORT $USER"_DB"
cat <(echo "Insert into part_nyc(supplier, color, on_hand, descr) Values (0, 0, 20, 'Description')")|psql -h localhost -p $PGPORT $USER"_DB"
cat <(echo "Insert into part_nyc(supplier, color, on_hand, descr) Values (0, 0, 20, 'Description')")|psql -h localhost -p $PGPORT $USER"_DB"
cat <(echo 'SELECT part_number FROM part_nyc WHERE on_hand=20;')|psql -h localhost -p $PGPORT $USER"_DB"