!SLIDE subsection
# slouch

!SLIDE huge
# slouch
[slouch.herokuapp.com](https://slouch.herokuapp.com/)

[github.com/will/slouch](http://github.com/will/slouch)


!SLIDE bullets
# motivations
* see how far js+json can go
* what's good
* what's bad

!SLIDE bullets incremental
# exploration
* derby / meteor
* really neat, promising
* too much

!SLIDE bullets
# stack
* client - backbone.js
* server - node.js
* database - postgres/plv8

!SLIDE bullets
# rapid prototyping
* client side only
* local storage
* super easy to change

!SLIDE bullets
# add node
* still don't know what I want
* model database as hash
* still easy to change

!SLIDE bullets
    @@@ coffeescript
    list = [ {id: uuid(), desc: 'something'} ]

    app.get '/list', (req, res) ->
      res.send JSON.stringify(list)

    app.post '/list', (req, res) ->
      item = request.body
      item.id = uuid()
      list.push item
      res.send JSON.stringify(item)

!SLIDE
# add postgres
    @@@ sql
    CREATE EXTENSION plv8;
    CREATE EXTENSION "uuid-ossp";
    CREATE TABLE hopes (
      id uuid
        primary key
        default (uuid_generate_v4())
    , data json);


!SLIDE
# evolving the app
* add
