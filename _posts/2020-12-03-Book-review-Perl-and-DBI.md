---
layout: post
title: Book review "Perl and DBI"
date: 2020-12-03 14:22:07
---
![Perl and DBI](/assets/images/sjw7l4i324yt7mzcxfln.jpg)

First, this is [DBI](https://metacpan.org/pod/DBI) :)

## A kind writer
I really love the way it is written, simple and direct and the book progress is very smooth.

One of the greatness of the book it to talk about DBI which is great by itself.

Provides links to resources related to the book, very cool. 

## Interesting curiosities
* DBI was created in 1992 !!
* Do you know **mSQL** ? **bdb** ? **ndbm** **gdbm** **sdbm** **odbm** ? **Ingres** ? **Empress** ?
* Do you know **dBase** ? **XBase** ? 

## Notions about DB internals 
The book explains concepts about data management and that is  very clear and valuable.

The notion of **delimited fields** vs **fixed fields** :
* Fixed field is better for random access
* Delimited is better for other areas (and since we have a fast CPU)

The notion of **normalized data** vs **not normalized data** : 
* Normalized schema allow non redundant info but...
* Not normalized can allow fast access (views)

And others topics in bulk :
* Interesting paragraph about flock shared and exclusive
* **OLE** and **ADO**
* **BLOB** vs **CLOB**
![Blob](/assets/images/pah7q5x5f35bs6w0m5ab.jpg)

blob !

## About DBI itself
* DBI started in Perl4
* DBI is the *interface* (Database Independent)
* DBD is the *driver* (Database Dependent)
* `dbish` the *dbi shell*
* You can choose level or reporting and warning level with `attr`
* If the threading is used, then the driver uses a mutex
* You should `bind` values (handy and secure) + binding values can increase perfs
* The "0 but true" E0E trick

## ODBC
DBI existed before ODBC.

ODBC is basically :
* A standard SQL syntax
* Standard error codes
* Rich metadatas
* Attributes and options

Why standard SQL ? Because it exists several SQL syntax (even a simple `concat` has 5 differents possible syntax)

#### How smart is doing ODBC for simulating DBI/DBD ? 

By trying to read SQL92 and convert into vendor DB syntax or pass directly vendor DB specific when SQL92 parsing fails :

```
                          SQL for MySQL
       if SQL92         -----------------> MySQL
user -----------> ODBC |
 |      SQL92           -----------------> Oracle
 |                        SQL for Oracle     ^
 |                                           |
  -------------------------------------------
       DB Specific (not parsed OK SQL92)
```
   
What about error codes :
```
 ODBC -----------------------------------> MySQL
 user <---------------------------------- Oracle
               error 23000 (std error)
```

With DBI the error code can change BUT ODBC has standard error codes with  a moving standard depending the versions (!!).

Details about **Win32::ODBC**, **DBI::ODBC**, **DBI::Proxy** are very cool.

## This is the end my friend
At the end, there are some appendix that to be honest I don't read completely. The book also becomes more like a reference book.

I come back to this book for sure the day I need again to deal with DBI :smiley: 

As a conclusion, this is a very nice book, very interesting with deep technical details.

It explores the master piece that is DBI, and I truly recommend this book.
