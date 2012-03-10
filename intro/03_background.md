!SLIDE subsection
# background

!SLIDE bullets
# couchdb
* document based
* http restfulish
* map reduce

!SLIDE
# documents

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

!SLIDE bullets
# what I want
* easily store semi-structured data
* efficiency query on that data
!SLIDE bullets transition=fade
# what I want
* cake
* eat it too

!SLIDE subsection
# getting there

!SLIDE bullets
# postgres
* a great database
* won't lose my data
* wal-e

!SLIDE bullets
# hstore?
* ⊕ already contrib
* ⊖ no nesting
* ⊖ only strings

!SLIDE bullets
# javascript
* everywhere
* good parts

!SLIDE bullets
# v8 javascript engine
* google
* compiles to native code (really fast)
* generational gc

!SLIDE bullets
# plv8
* v8 ❤ postgres
* trusted language
* Itagaki Takahiro

