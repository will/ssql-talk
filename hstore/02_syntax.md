!SLIDE commandline incremental
# hstore syntax
    $ select 'a=>x, b=>y'::hstore -> 'a';
    x

    $ select 'a=>x, b=>y'::hstore || 'b=>p, c=>q'::hstore;
    "a"=>"b", "b"=>"p", "c"=>"q"

    $ select 'a=>x, b=>y, c=>z'::hstore - 'a=>t, b=>y'::hstore
    "a"=>"x", "c"=>"z"

!SLIDE commandline incremental
# hstore usage
    $ SELECT * FROM products WHERE attrs->'color'='red';
    ...results
    $ UPDATE products SET attrs = attrs || ('color' => 'blue');
    adds or updates 'color'

!SLIDE
# joins
    @@@ sql
    SELECT * FROM products, companies
    WHERE attrs->'color'='red'
      AND companies.id=company_id;

!SLIDE
# hstore index
    @@@ sql
    CREATE INDEX prod_color
      ON products ((attrs->'color'));

    CREATE INDEX prod_attrs
      ON products USING GIN(attrs);
