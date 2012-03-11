!SLIDE
# install
    @@@ sql
    CREATE EXTENSION hstore;

!SLIDE
# coming in ActiveRecord 4

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

# pretty good …but

!SLIDE bullets
# not so great things
* no nesting
* only strings

!SLIDE bullets
# naming convention workarounds
* time: `*_at`
* int: `num_*` or `*_size`
* bool: `*?`
* str: `*`


