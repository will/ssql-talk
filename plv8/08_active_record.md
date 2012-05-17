!SLIDE subsection
# ruby

!SLIDE
# all of that should be transparent

!SLIDE
# work from both ends

!SLIDE
    @@@ ruby
    >> Product
    => Product(id: integer, data: json,
    created_at: datetime,updated_at: datetime)
    >> a = Product.new
    => #<Product id: nil, data: {}, created_at: nil, updated_at: nil>

!SLIDE
    @@@ ruby
    >> a.data["hello"] = 3
    => 3
    >> a.data["ok"] = {"nested" => true}
    => {"nested"=>true}
    >> a
    => #<Product id: nil,
         data: {"hello"=>3,
         "ok"=>{"nested"=>true}},
         created_at: nil, updated_at: nil>

!SLIDE smaller
    @@@ ruby
    >> a.save
      SQL (0.4ms)  INSERT INTO "products"
      ("created_at", "data", "updated_at")
      VALUES ($1, $2, $3) RETURNING "id"
      [["created_at", Thu, 29 Sep 2011 01:36:53 UTC +00:00],
       ["data", "{\"hello\":3,\"ok\":{\"nested\":true}}"],
       ["updated_at", Thu, 29 Sep 2011 01:36:53 UTC +00:00]]
    => true

!SLIDE
    @@@ ruby
    >> b = Product.first
    Product Load (0.2ms)  SELECT "products".* …
    => #<Product id: 4, data: {"hello"=>3 …
    >> b.data
    => {"hello"=>3, "ok"=>{"nested"=>true}}
    >> b.data.class
    => Hash


!SLIDE
    @@@ sql
    >> (1..30).each { |cost|
       Product.create :data => {'cost' => cost} }
    >> Product.where('cost > 10').count
    => 20
       SELECT COUNT(*) FROM "products"
       WHERE (json_path('.cost', data)::numeric
               > 10)
!SLIDE
    @@@ sql
    >> Product.where("data -> '.cost' > 10").
         limit(1)

      SELECT "products".* FROM "products" WHERE
      (json_path('.cost', data)::numeric > 10)
      LIMIT 1

    => [#<Product id: 16, data: {"cost"=>11},…

!SLIDE
# bindings for other languages

!SLIDE
# function package
