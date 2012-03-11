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
    $ SELECT * FROM books WHERE attrs->'color'='red';
    ...results
    $ CREATE INDEX book_color ON books ((attrs->'color'));
    CREATE INDEX
    $ UPDATE books SET attrs = attrs || ('color' => 'blue');
    adds or updates 'color'
