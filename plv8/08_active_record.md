!SLIDE subsection
# ruby

!SLIDE
# all of that should be transparent

!SLIDE smaller
    @@@ ruby
    >> Thing
    => Thing(id: integer, data: text,
    created_at: datetime, updated_at: datetime)
    >> a = Thing.new
    => #<Thing id: nil, data: {}, created_at: nil, updated_at: nil>
    >> a.data["hello"] = 3
    => 3
    >> a.data["ok"] = {"nested" => true}
    => {"nested"=>true}
    >> a
    => #<Thing id: nil,
         data: {"hello"=>3, "ok"=>{"nested"=>true}},
         created_at: nil, updated_at: nil>

!SLIDE smaller
    @@@ ruby
    >> a.save
       (0.1ms)  BEGIN
      SQL (0.4ms)  INSERT INTO "things"
      ("created_at", "data", "updated_at")
      VALUES ($1, $2, $3) RETURNING "id"
      [["created_at", Thu, 29 Sep 2011 01:36:53 UTC +00:00],
       ["data", "{\"hello\":3,\"ok\":{\"nested\":true}}"],
       ["updated_at", Thu, 29 Sep 2011 01:36:53 UTC +00:00]]
       (0.1ms)  COMMIT
    => true

!SLIDE
    @@@ ruby
    >> a_prime = Thing.first
    Thing Load (0.2ms)  SELECT "things".* …
    => #<Thing id: 4, data: {"hello"=>3 …
    >> a_prime.data
    => {"hello"=>3, "ok"=>{"nested"=>true}}
    >> a.data.class
    => Hash

!SLIDE
    @@@ sql
    >> Thing.where("data -> '.cost' > 10").limit(1)
      Thing Load (0.4ms)
      SELECT "things".*
      FROM "things" WHERE
       (json_path('cost', data)::numeric > 10)
      LIMIT 1
    => [#<Thing id: 16, data: {"cost"=>11},…


