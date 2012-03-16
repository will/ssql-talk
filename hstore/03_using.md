!SLIDE
# install hstore
    @@@ sql
    CREATE EXTENSION hstore;

!SLIDE huge
# ActiveRecord 4

!SLIDE
    @@@ ruby
    Product.where(
     "attrs @> (:key => :value)",
     key: 'color', value: 'red')

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

product_id=114 buyer='will l' price=53 count=2

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

!SLIDE huge
# use it today


