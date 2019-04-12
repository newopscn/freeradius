# freeradius

## Refference

* https://wiki.freeradius.org/guide/SQL-HOWTO-for-freeradius-3.x-on-Debian-Ubuntu

## Populating SQL

```bash
mysql -u radius -p
>  use radius;
>  insert into radcheck (username,attribute,op,value) values("fredf", "Cleartext-Password", ":=", "wilma");
```
