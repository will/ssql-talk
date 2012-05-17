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
    >> a.data["cost"] = 3
    => 3
    >> a.data["ok"] = {"nested" => true}
    => {"nested"=>true}
    >> a
    => #<Product id: nil,
         data: {"hello"=>3,
         "ok"=>{"nested"=>true}},
         created_at: nil, updated_at: nil>

!SLIDE
    @@@ sql
    >> (1..30).each { |cost|
       Product.create :data => {'cost' => cost} }

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
