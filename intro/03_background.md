!SLIDE subsection
# background

!SLIDE smaller
# php/mysql

!SLIDE center smaller
![knot](knot.jpg)
[(cc) veebl](http://www.flickr.com/photos/veebl/2347345630/)

!SLIDE
# active record

!SLIDE huge
# couchdb

!SLIDE bullets
* http ➡ caching, load balancing
* restful(ish)
* multi-master
* map/reduce views

!SLIDE bullets
* schemaless
* json
* document based

!SLIDE
# easy to understand love
# for mongo and couch

!SLIDE
# documents are fun

!SLIDE
# sql is hard

!SLIDE
# tables suck

!SLIDE
# migrations are painful
(so avoid them)

!SLIDE
# 3nf is a pain in the ass

!SLIDE
# often my data
# is not relational

!SLIDE
# I want my storage to
# look like my code

!SLIDE
    @@@ c
    song[]
      title, *artist, etc
      versions[]
        lyrics, date, etc
        tracks[]
          name
          file
            name, size, path, etc

!SLIDE bullets
# _could_ be done in sql
(but I'm not smart enough to keep all that in my head)

