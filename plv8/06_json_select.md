!SLIDE subsection
# json:select()
[jsonselect.org](http://jsonselect.org/)

!SLIDE
    @@@ sql
    create or replace function
    json_select(selector text, data json)
    returns json as $$
      exports = {};
      // json select code
      return JSON.stringify(
        exports.match(selector,
                      JSON.parse(data)));
    $$ LANGUAGE plv8 IMMUTABLE STRICT

!SLIDE
    @@@ sql
    select * from people limit 1;
    data | {"name":"Agnes Lowe DDS",
            "age":27,
            "siblings":2,
            "numbers":[
              {"type":"work",
               "number":"284-404-1041"},
              {"type":"home",
               "number":"752-434-3997 x199"}]}

!SLIDE smaller
    @@@ sql
    select json_select('.name nth-child(1)', data) as name,
           json_select('.numbers', data) as phone
    from people;
    -[ RECORD 1 ]------------------------------------------
    name  | "Agnes Lowe DDS"
    phone | [{"type":"work","number":"284-404-1041"},
              "type":"home","number":"752-434-3997 x199"}]
    -[ RECORD 2 ]-------------------------------------------
    name  | "Carson Littel PhD"
    phone | [{"type":"work","number":"(722)987-3493 x84542"},
              "type":"home","number":"512.062.9621 x2652"}]
!SLIDE
    @@@ sql
    select count(*) from people
    where json_select('$.age', data)::int=26;
    count | 10074

!SLIDE huge
# rough edges

