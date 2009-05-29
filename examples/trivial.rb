$:.unshift(File.expand_path(File.join(File.dirname(__FILE__), "../lib")))
require 'johnson'

include Johnson

@rt = Runtime.new

retval = @rt.evaluate("1 + 1")
puts "Result of evaluation is #{retval}"

## Proxies get reused

foo = @rt.evaluate('foo = { bar: 10 }')
@rt['same_foo'] = foo

puts @rt.evaluate('foo == same_foo')

## Inject ruby objects in js land

@rt[:foo] = 'Hola'
puts @rt.evaluate('foo')

## Use multiple runtimes

@rt_2 = Runtime.new
@rt_2[:foo_2] = 'Ola'
@rt_2[:foo] = @rt[:foo]

puts @rt_2.evaluate('foo_2 + foo')

## Call function from RubyLand

f = @rt.evaluate("function(x) { return x*2; }")
puts "Result of f.call is #{f.call(42)}"
