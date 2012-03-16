!SLIDE subsection
# ruby

!SLIDE
# all of that should be transparent


!SLIDE
    @@@ sql
    >> Thing.where("data -> '.cost' > 10").limit(1)
      Thing Load (0.4ms)
      SELECT "things".*
      FROM "things" WHERE
       (json_path('cost', data)::numeric > 10)
      LIMIT 1
    => [#<Thing id: 16, data: {"cost"=>11},…


