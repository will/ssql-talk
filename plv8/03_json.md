!SLIDE subsection
# back to documents

!SLIDE
    @@@ javascript
    {
      "name": "Brooks DuBuque",
      "age": 36,
      "siblings": 2,
      "numbers": [
        {
          "type":   "work",
          "number": "684.573.3783 x368"
        },
        {
          "type":   "home",
          "number": "625.112.6081"
        }
      ]
    }

!SLIDE smaller
    @@@ sql
    select * from people limit 7;
                              data
    ----------------------------------------------------------------------------------------------------------------------------------------
     {"name":"Clifton Klein","age":69,"siblings":1,"numbers":[{"type":"cell","number":"624.615.1964 x68149"},{"type":"home","number":"1-588-984-1901 x30563"},{"type":"cell","number":"198.669.3710"}]}
     {"name":"Earline Tremblay","age":71,"siblings":1,"numbers":[{"type":"home","number":"1-725-117-9342 x62197"},{"type":"cell","number":"1-206-027-1902"}]}
     {"name":"Candice Gusikowski","age":59,"siblings":2,"numbers":[{"type":"home","number":"584-847-7366 x0690"}]}
     {"name":"Juanita Bayer Sr.","age":45,"siblings":3}
     {"name":"Miss Stacy Stark","age":14,"siblings":0,"numbers":[{"type":"work","number":"1-445-109-8980"}]}
     {"name":"Kraig Sporer","age":30,"siblings":0}
     {"name":"Leopold Hagenes","age":33,"siblings":3}
    (7 rows)

    Time: 0.247 ms
!SLIDE
    @@@ sql
    select count(*) from people;
    -[ RECORD 1 ]-
    count | 1000000

!SLIDE
    @@@ sql
    select avg(get_numeric('age', data))
    from people;
    -[ RECORD 1 ]------------
    avg | 24.4913870000000000
    Time: 6641.060 ms

    select avg(age)
    from ages;
    -[ RECORD 1 ]------------
    avg | 24.4914240000000000
    Time: 138.262 ms

!SLIDE smaller
    @@@ sql
    with jsonages as
    (select get_numeric('age', data) as age from people)
    select sum(age), avg(age), stddev(age), min(age), max(age)
    from jsonages;
    -[ RECORD 1 ]---------------
    sum    | 49496077
    avg    | 49.4960770000000000
    stddev | 28.8685543109366494
    min    | 0
    max    | 99

    select sum(age), avg(age), stddev(age), min(age), max(age)
    from ages;
    -[ RECORD 1 ]---------------
    sum    | 49496077
    avg    | 49.4960770000000000
    stddev | 28.8685543109366494
    min    | 0
    max    | 99

    Time: 2026.410 ms

!SLIDE
    @@@ sql
    select count(*) from people
    where get_numeric('age', data)=26;
    count | 10074
    Time: 5720.032 ms

    create index age
    on people (get_numeric('age', data));
    CREATE INDEX
    Time: 10902.154 ms

    select count(*) from people
    where get_numeric('age', data)=26;
    count | 10074
    Time: 35.775 ms

!SLIDE bullets
* same trade off as couch
* except postgres can combine indicies

!SLIDE
    @@@ sql
    explain select count(*)
    from people where
      get_numeric('age', data)=26 and
      get_numeric('siblings', data)=1;
                                                              QUERY PLAN
    -------------------------------------------------------------------------------------------------------------------------------
     Aggregate  (cost=12686.58..12686.59 rows=1 width=0)
       ->  Bitmap Heap Scan on people  (cost=4832.94..12680.50 rows=2431 width=0)
             Recheck Cond: ((get_numeric('age'::text, data) = 26::numeric) AND (get_numeric('siblings'::text, data) = 1::numeric))
             ->  BitmapAnd  (cost=4832.94..4832.94 rows=2431 width=0)
                   ->  Bitmap Index Scan on age  (cost=0.00..181.11 rows=9667 width=0)
                         Index Cond: (get_numeric('age'::text, data) = 26::numeric)
                   ->  Bitmap Index Scan on siblings  (cost=0.00..4650.36 rows=251433 width=0)
                         Index Cond: (get_numeric('siblings'::text, data) = 1::numeric)
