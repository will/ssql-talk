!SLIDE subsection
# json path
[code.google.com/p/jsonpath](http://code.google.com/p/jsonpath/)

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

!SLIDE
    @@@ sql
    select json_path('$.numbers[0].type',data)
      from people limit 1;
    json_path | "work"

    select json_path('$.numbers[*].type',data)
      from people limit 1;
    json_path | ["work","home"]

!SLIDE
    @@@ sql
    select count(*) from people
      where json_path('$.age', data)::int=26;
    count | 10074

!SLIDE bullets
# small issues
* returns false (patched)
* returns arrays
* type casting

