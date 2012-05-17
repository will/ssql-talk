
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
      AND companies.id=products.company_id;

!SLIDE
# hstore index
    @@@ sql
    CREATE INDEX prod_color
      ON products ((attrs->'color'));

    CREATE INDEX prod_attrs
      ON products USING GIN(attrs);
