# [NZ Ruby Talks](http://talks.ruby.org.nz)

[![Dependency Status](https://gemnasium.com/nzruby/talks.png)](https://gemnasium.com/nzruby/talks)

NZ talks about Ruby, powered by [Middleman](http://middlemanapp.com).

You can view the site at [talks.ruby.org.nz](http://talks.ruby.org.nz).

## Contributing

If you write a blog post and we accept it, Ruby NZ will send you an :sparkles: exclusive :sparkles: prize pack. 

Here is how to do this:

1. Fork this repository.
2. On your fork, add a file: `source/talks/<year>/<month>-<day>-title.md`
3. Add some front matter:

```
---
title: <your amazing article>
layout: talk
author: <your beautiful name>
intro: <your exciting intro>
---
```

4. Write some things with [Markdown](https://help.github.com/en/github/writing-on-github)
5. Open a pull request
6. Have it accepted
7. Tell us your mailing address through Slack or email
8. Receive :sparkles: exclusive :sparkles: prize pack
9. Be showered in community spirit and admiration from your peers

## Development environment

Clone this repository.

On Mac OS X or Linux, `cd` into the project directory and run:

    bin/setup

On Windows:

1. Install [Ruby 2.6.3 or higher](http://ruby-lang.org)
2. Install [Bundler](http://gembundler.com)
3. Run `bundle install` from the project directory
4. Run `bundle exec middleman server` to start a local server

## Publishing

If you have access, you can push the site live by running:

    rake publish

## License

Ruby Logo is [CC0](https://creativecommons.org/publicdomain/zero/1.0/) courtesy of @aupajo.
