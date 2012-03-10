!SLIDE subsection
# mustache.js
[mustache.github.com](http://mustache.github.com/)

!SLIDE
    @@@ sql
    create or replace function
    mustache(template text, view json)
    returns text as $$

       …400 lines of mustache.js…
      return Mustache.to_html(
        template, JSON.parse(view)
      )

    $$ LANGUAGE plv8 IMMUTABLE STRICT;

!SLIDE
    @@@ sql
    select mustache(
      'hello {{#things}}{{.}} {{/things}}',
      '{"things": ["world", "from", "will"]}'
    );
             mustache
      -----------------------
       hello world from will

