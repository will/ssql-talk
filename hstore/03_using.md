!SLIDE
# install hstore
    @@@ sql
    CREATE EXTENSION hstore;

!SLIDE
# ActiveRecord 4

!SLIDE
# sequel-hstore
[github.com/pvh/sequel-hstore](https://github.com/pvh/sequel-hstore)

`gem install sequel-hstore`

!SLIDE
    @@@ ruby
    create_table(:things) do
      primary_key :id
      column :attrs,
             :hstore,
             :default_value => ''
    end

!SLIDE
# observations

!SLIDE
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


