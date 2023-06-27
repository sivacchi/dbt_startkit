#!/bin/sh
curl -L https://www.postgresqltutorial.com/wp-content/uploads/2019/05/dvdrental.zip -o /tmp/dvdrental.zip
unzip /tmp/dvdrental.zip -d /tmp

echo create database...
psql -U postgres -c 'create database dvdrental'
pg_restore -U postgres -d dvdrental /tmp/dvdrental.tar
psql -U postgres dvdrental -c 'create schema dwh'
psql -U postgres dvdrental -c 'create schema mart'
psql -U postgres dvdrental -c 'create table dwh.calendar as (select $$2006-01-01$$::date + g.i as date from generate_series(0, 730) as g(i));'
psql -U postgres -c 'ALTER DATABASE dvdrental REFRESH COLLATION VERSION'
