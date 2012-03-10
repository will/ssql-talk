!SLIDE smaller
# bad input is a problem
    @@@ sql
    insert into baddata values ('this is not good json');
    INSERT 0 1

    select get_numeric('age', data) from baddata ;
    ERROR:  SyntaxError: Unexpected token h
    DETAIL:  undefined() LINE 0: this is not good json

!SLIDE smaller
# domains are the answer

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
