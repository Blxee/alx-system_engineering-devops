#!/usr/bin/env ruby
match = ARGV[0].match(/\[from:(.+?)\] \[to:(.+?)\] \[flags:(.+?)\]/)
puts match.captures.join(',')
