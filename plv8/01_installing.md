!SLIDE subsection
# installing plv8

!SLIDE bullets
# requirements
* postgres
* v8

!SLIDE bullets
# plv8
* [code.google.com/p/plv8js](http://code.google.com/p/plv8js/)
* `git://github.com/fdr/plv8js.git`

!SLIDE bullets
# plv8
* `PG_XS=1 make install`
* `CREATE EXTENSION plv8`
* `CREATE LANGUAGE plv8`
