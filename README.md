# Journal

Time journal for [a bachelor thesis](http://www.chalmers.se/cse/SV/utbildning/grundutbildning/kandidatniva/kandidatarbeten-2012/water-en-ersattning-for) written in Rails.

## Installation

1. Clone project. `git clone git://github.com/oleander/journal-rb.git`
2. Install dependencies. `bundle install`
3. Create database. `bundle exec rake db:create`
4. Migrate database. `bundle exec rake db:migrate`
5. Start server. `rails s --debugger`

## Features

- Mardown support with live preview.
- Authentication using Google OAuth.
- PDF project exporter.

## Live demo

[journal.oleander.nu](http://journal.oleander.nu)