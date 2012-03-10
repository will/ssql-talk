!SLIDE subsection
# using plv8

!SLIDE center transition=fade
![fib](fib.jpg)

!SLIDE
    @@@ sql
    CREATE OR REPLACE FUNCTION
    psqlfib(n int) RETURNS int AS $$
     BEGIN
         IF n < 2 THEN
             RETURN n;
         END IF;
         RETURN psqlfib(n-1) + psqlfib(n-2);
     END;
    $$ LANGUAGE plpgsql IMMUTABLE STRICT;

!SLIDE
    @@@ sql
    select n, psqlfib(n)
    from generate_series(0,35,5) as n;
       n  | psqlfib
      ----+---------
        0 |       0
        5 |       5
       10 |      55
       15 |     610
       20 |    6765
       25 |   75025
       30 |  832040
       35 | 9227465
      (8 rows)

      Time: 172532.968 ms
!SLIDE
    @@@ sql
    create or replace function
    fib(n int) returns int as $$

      function fib(n) {
        return n<2 ? n : fib(n-1) + fib(n-2)
      }
      return fib(n)

    $$ LANGUAGE plv8 IMMUTABLE STRICT;

!SLIDE
    @@@ sql
    select n, fib(n)
    from generate_series(0,35,5) as n;
       n  |   fib
      ----+---------
        0 |       0
        5 |       5
       10 |      55
       15 |     610
       20 |    6765
       25 |   75025
       30 |  832040
       35 | 9227465
      (8 rows)

      Time: 366.738 ms

!SLIDE
    @@@ sql
    create or replace function
    fib2(n int)returns int as $$

      var memo = {0: 0, 1: 1}
      function fib(n) {
        if(!(n in memo))
          memo[n] = fib(n-1) + fib(n-2)
        return memo[n]
      }
      return fib(n);

    $$ LANGUAGE plv8 IMMUTABLE STRICT;

!SLIDE
    @@@ sql
    select n, fib2(n)
    from generate_series(0,35,5) as n;
       n  |   fib
      ----+---------
        0 |       0
        5 |       5
       10 |      55
       15 |     610
       20 |    6765
       25 |   75025
       30 |  832040
       35 | 9227465
      (8 rows)

      Time: 0.296 ms

