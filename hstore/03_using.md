!SLIDE
# install hstore
    @@@ sql
    CREATE EXTENSION hstore;

!SLIDE huge
# ActiveRecord 4

!SLIDE smaller
#[hstoredemo.herokuapp.com](http://hstoredemo.herokuapp.com/)
#[github/heroku/hstore_demo](http://github.com/heroku/hstore_example)
thanks [@Schneems](http://twitter.com/Schneems)

!SLIDE huge
# sequel

!SLIDE huge
# observations

!SLIDE huge
# wcld
[github.com/ryandotsmith/wcld](https://github.com/ryandotsmith/wcld)

!SLIDE bullets
# pretty good …but
* no nesting
* only strings

!SLIDE bullets
# naming convention workarounds
* time: `*_at`
* int: `num_*` or `*_size`
* bool: `*?`
* str: `*`


