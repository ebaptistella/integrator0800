Integrator 0800net
===================
Plugin for redmine integration with Ellevo 0800net

Status [![Build Status](https://travis-ci.org/ebaptistella/integrator0800.svg?branch=master)](https://travis-ci.org/ebaptistella/integrator0800)
---------

Requirements
-------------
+ Ruby `>= 2.0.0`
+ Redmine `>= 3.2.0`

Installing
-----------
+ Clone this repository into `redmine/plugins/integrator0800`.
```ssh
$ cd redmine/plugins
$ git clone https://github.com/ebaptistella/integrator0800.git
```

+ Install dependencies and migrate database.
```ssh
$ bundle install
$ rake redmine:plugins:migrate NAME=integrator0800 RAILS_ENV=production
```

+ Restart your Redmine web server.

License
--------
This plugin is licensed under the terms of GNU/GPL v3+.
See COPYING and LICENSE for details.
