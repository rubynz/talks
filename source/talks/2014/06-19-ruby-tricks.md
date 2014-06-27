---
title: Ruby Tricks
layout: talk
author: Pete Nicholls
venue: Christchurch Ruby
intro: A collection of Ruby tricks.
---

## The weirdest way to write an empty string

```ruby
%%%%%%%
```

Explanation (try this out in `pry` or `irb`):

```ruby
%( a string with the "%" syntax )
# => " a string with the \"%\" syntax "
%! can use almost any character to delineate a string !
# => " can use almost any character to delineate a string "
%% even a percent sign itself %
# => " even a percent sign itself "
%%% == ""
# => true
"strings also have a percent method %s" % "for formatting values"
# => "strings also have a method for formatting values"
"" % ""
# => ""
%%% % %%%
# => ""
%%%%%%%
# => ""
```

## Hash.new takes a block

Anything specified in the block to `Hash.new` is considered to be the default value.

```ruby
# true by default
permissions = Hash.new { true }
permissions[:jim]             # => true
permissions[:dwight]          # => true
permissions[:dwight] = false
permissions[:dwight]          # => false
```

More precisely, the block is called whenever a key lookup fails.

This has some interesting characteristics:

```ruby
upper = Hash.new { |hash, key| key.upcase }
upper['word']                # => "WORD"
upper['class']               # => "CLASS"
upper['iphone']              # => "IPHONE"
upper['iphone'] = 'iPHONE'
upper['iphone']              # => "iPHONE"
```

Two values are passed to the block, `hash` (a reference to the hash itself), and `key`.

You can use these values to set the value of a key at the moment the lookup fails:

```ruby
# No need to check for nil
observers = Hash.new { |hash, key| hash[key] = [] }
observers
# => {}
observers[:event_a] << :listener_a
observers[:event_a] << :listener_b
observers[:event_b] << :listener_a
observers
# => {
#   :event_a => [:listener_a, :listener_b],
#   :event_b => [:listener_a]
# }
```

You can use this trick to memoize:

```ruby
def regular_ol_fib(n)
  return n if (0..1).include?(n)
  regular_ol_fib(n - 1) + regular_ol_fib(n - 2)
end

awesome_fib = Hash.new do |cache, n|
 cache[n] = awesome_fib[n - 2] + awesome_fib[n - 1]
end

awesome_fib[0] = 0
awesome_fib[1] = 1

awesome_fib[34]      # took 0.047 milliseconds
regular_ol_fib(34)   # took 4.5 seconds
awesome_fib[3000]    # took 3.69 milliseconds
regular_ol_fib(3000) # don't even try this
```

## Autovivification

One interesting thing about the `Hash.new` block is that you can get a reference to it from the hash instance itself:

```ruby
hash_with_block = Hash.new { various_happenings }
hash_with_block.default_proc # => #<Proc:0x007faf3ac93d08>
```

Because `Hash.new` yields the hash itself, you can refer to the block *inside the block itself*:

```ruby
autovivification = Hash.new { |hash, key| hash[key] = Hash.new(&hash.default_proc) }
autovivification[:keys][:dont][:even][:exist][:until] = :now

autovivification # => {:keys=>{:dont=>{:even=>{:exist=>{:until=>:now}}}}}
```

(*Auto* means “self” and *vivify* means “give life to”.)

## Shipping data with code

When you use the keyword `__END__`, Ruby considers the script to be over at that point.

Anything written beyond it will be ignored:

```ruby
# some ruby code
__END__
this will never be interpreted
```

However, you can access this content with the `DATA` object:

```ruby
puts DATA.read # Will print "Hello there!"
__END__
Hello there!
```

You can use this to include templates, data, or anything else you like along with your script.

```ruby
quotes = DATA.to_a
puts "Random Chuck Norris quote:"
puts quotes.shuffle.pop

__END__
When Chuck Norris throws exceptions, it’s across the room.
All arrays Chuck Norris declares are of infinite size, because Chuck Norris knows no bounds.
Chuck Norris doesn’t have disk latency because the hard drive knows to hurry the hell up.
Chuck Norris writes code that optimizes itself.
Chuck Norris can’t test for equality because he has no equal.
```
