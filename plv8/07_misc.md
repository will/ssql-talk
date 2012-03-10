!SLIDE bullets
# limitations
* `DO` anonymous fns are psql only
* some reparsing

!SLIDE smaller
    @@@ sql
    create or replace function
    js(src text) returns text as $$
      return eval("(function() { " + src + "})")();
    $$ LANGUAGE plv8;

    select js('return new Date()');
    js | Mon Oct 10 2011 20:58:01 GMT-0700 (PDT)
    Time: 0.326 ms

    select js('i=9436193023*207743; return i.toString(36)');
    js | javascript

    select js('return data.name.split(" ").sort().join(" ")',
              data) from people limit 1;
    js | Agnes DDS Lowe


