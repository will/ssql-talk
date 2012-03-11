!SLIDE subsection
# background

!SLIDE
# plain active record

!SLIDE bullets
# couchdb
* document based
* http restfulish
* map reduce

!SLIDE
# documents are fun

!SLIDE
# tables suck

!SLIDE
# 3nf is a pain in the ass

!SLIDE
# often my data
# is not relational

!SLIDE
# mergefm 'schema'
    @@@ c
    song[]
      title, *artist, etc
      versions[]
        lyrics, date, etc
        tracks[]
          name
          file

!SLIDE bullets
# _could_ be done in sql
(but I'm not smart enough to keep all that in my head)

