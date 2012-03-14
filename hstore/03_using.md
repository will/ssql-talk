!SLIDE
# install hstore
    @@@ sql
    CREATE EXTENSION hstore;

!SLIDE huge
# ActiveRecord 4

!SLIDE huge
# sequel

!SLIDE
    @@@ ruby
    create_table(:things) do
      primary_key :id
      column :attrs,
             :hstore,
             :default_value => ''
    end

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


