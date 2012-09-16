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
* model database as in-memory hash
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

!SLIDE bullets
# add postgres
* keep it simple
* one table, key/data

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

!SLIDE subsection
# evolving the app

!SLIDE
# add date

    @@@ coffeescript
    defaults: ->
      date: new Date()

!SLIDE
# add bumpcount

    @@@ coffeescript
    defaults: ->
      bumpCount: new Date()
    bump: ->
      @model.set('bumpCount',
                 @model.get('bumpCount') + 1)

!SLIDE
# add google auth
    @@@ coffeescript
    app.post '/list', (req, res) ->
      hope = req.body

      hope.user_id = req.user.google.id

      jstore.create hope, (err, hope) ->
        res.send JSON.stringify(err || hope)

!SLIDE
# add google auth
    @@@ sql
    select * from hopes
    where json_select('.user_id', data)=$1

!SLIDE bullets
* all very easy
* all very fast

!SLIDE
# one table?
yeah that's the point
keep it simple
thought about doing a huge complicated nested example that shows off json, but the real value is how easy it is to build new things
people are choosing 'nosql' cause it is easy
they'd be far better off if postgres was easy