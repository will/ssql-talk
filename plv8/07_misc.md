!SLIDE subsection
# here's a bad idea

!SLIDE
    @@@ sql
    create or replace function
    js(src text) returns text as $$
      return eval(
      "(function() { " + src + "})"
      )();
    $$ LANGUAGE plv8;

!SLIDE
    @@@ sql
    select js('return new Date()');
    js | Wed Mar 14 2012 01:07:13 GMT-0700 (PDT)

    select js('i=9436193023*207743;
               return i.toString(36)');
    js | javascript

    select js('return data.name.
          split(" ").sort().join(" ");',
              data) from people limit 1;
    js | Agnes DDS Lowe


