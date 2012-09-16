!SLIDE bullets incremental
# what about code sharing?
* _mostly_ a failure
* but one awesome win

!SLIDE subsection
# validations

!SLIDE commandline incremental
# bad json

    $ INSERT INTO hopes (data) values ('notjson"');
    ERROR:  invalid input syntax for type json
    LINE 1: INSERT INTO hopes (data) values ('notjson"');
                                             ^
    DETAIL:  Token "notjson" is invalid.
    CONTEXT:  JSON data, line 1: notjson...

!SLIDE commandline incremental
# bad data?

    $ INSERT INTO hopes (data) values ('{"hi": "hey"}');
    INSERT 0 1
    $ select ':(' as sad;
    -[ RECORD 1 ]
    sad | :(

!SLIDE smaller
# server

    @@@ coffeescript
    checkModel = (model) ->
      return 'date not set' unless model.date
      return 'description missing' unless model.desc
      return 'description too short' if model.desc.length < 5
      return 'description too long'  if model.desc.length > 100
      return 'bumpcount not positive' unless model.bumpCount >= 0
!SLIDE smaller
# client

    @@@ javascript
    var checkModel = function(model) {
      if (!model.date)             { return 'date not set'; }
      if (!model.desc)             { return 'description missing'; }
      if (model.desc.length < 5)   { return 'description too short'; }
      if (model.desc.length > 100) { return 'description too long'; }
      if (!(model.bumpCount >= 0)) { return 'bumpcount not positive'; }
    };

!SLIDE smaller
# postgres

    @@@ javascript
    CREATE OR REPLACE FUNCTION check_model(raw json)
    RETURNS bool AS $$

    var checkModel = function(model) {
      if (!model.date)             { return 'date not set'; }
      if (!model.desc)             { return 'description missing'; }
      if (model.desc.length < 5)   { return 'description too short'; }
      if (model.desc.length > 100) { return 'description too long'; }
      if (!(model.bumpCount >= 0)) { return 'bumpcount not positive'; }
    };
    return checkModel( JSON.parse(raw) ) === undefined;

    $$ LANGUAGE plv8 IMMUTABLE STRICT;

!SLIDE
# postgres

    @@@ sql
    ALTER TABLE hopes
      ADD CONSTRAINT check_model
      CHECK (check_model(data));

!SLIDE smaller
# validated

    @@@ sql
    => INSERT INTO hopes (data)
       VALUES ('{"hi": "hey"}');
    ERROR: new row for relation "hopes" violates
    check constraint "check_model"

    => INSERT INTO hopes (data)
       VALUES ('{"desc":"do a thing",
                 "date":"2012-09-15T02:29:06.904Z",
                 "bumpCount":5}');
    INSERT 0 1

!SLIDE bullets
# sequel

* check constraints
* metadata table
* before save validations
