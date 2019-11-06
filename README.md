# [NZ Ruby Talks](http://talks.ruby.org.nz)

[![Dependency Status](https://gemnasium.com/nzruby/talks.png)](https://gemnasium.com/nzruby/talks)

NZ talks about Ruby, powered by [Middleman](http://middlemanapp.com).

You can view the site at [talks.ruby.org.nz](http://talks.ruby.org.nz).

## Contributing

If you write a blog post and we accept it, Ruby NZ will send you an :sparkles: exclusive :sparkles: prize pack. 

Here is how to do this:

- Fork this repository.
- On your fork, add a file: `source/talks/<year>/<month>-<day>-title.md`
- Add some front matter:

```
---
title: <your amazing article>
layout: talk
author: <your beautiful name>
intro: <your exciting intro>
---
```

- Write some things with [Markdown](https://help.github.com/en/github/writing-on-github)
- Open a pull request
- Have it accepted
- Tell us your mailing address
- Receive :sparkles: exclusive :sparkles: prize pack
- Be showered in community spirit and admiration from your peers

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
