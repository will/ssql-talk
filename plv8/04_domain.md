!SLIDE huge
# json datatype!
postgres 9.2

!SLIDE smaller
# domains in the meantime

    @@@ sql
    create or replace function valid_json(json text)
    returns bool as $$
      try { JSON.parse(json); return true }
      catch(e) { return false}
    $$ LANGUAGE plv8 IMMUTABLE STRICT;

    select valid_json('{"key": "value"}'), valid_json('lol');
    valid_json | t
    valid_json | f
    Time: 0.283 ms

!SLIDE
    @@@ sql
    create domain json
      as text check(valid_json(VALUE));
    create table jsononly(data json);

    insert into jsononly values 'lol';
    ERROR:  syntax error at or near "'lol'"
    LINE 1: insert into jsononly values 'lol';

    insert into jsononly
      values ('{"ok": true}');
    INSERT 0 1
