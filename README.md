# NZ Ruby Talks

Talks given at NZ Ruby groups, powered by [Middleman](http://middlemanapp.com).
You can view the talks at [talks.ruby.org.nz](http://talks.ruby.org.nz)

## Development environment

Clone this repository.

On Mac OS X or Linux, `cd` into the project directory and run:

    script/setup

On Windows:

1. Install [Ruby 2.0.0](http://ruby-lang.org)
2. Install [Bundler](http://gembundler.com)
3. Run `bundle install` from the project directory
4. Run `bundle exec middleman server` to start a local server

## Publishing

If you have access, you can push the site live by running:

    rake publish
