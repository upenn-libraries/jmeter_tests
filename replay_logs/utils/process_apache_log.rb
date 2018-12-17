#!/usr/bin/env ruby
require 'time'

in_log_file = File.open('../input/input.log')
out_log_file = File.new('../input/input.csv', 'w')

in_log_file.each_line do |line|
  method = line.split(' ')[5].strip
  method[0] = ''
  next if method != 'GET'

  apache_date_pattern = /\[([^\[\]]+)\]/
  date = line.match(apache_date_pattern)[1]
  timestamp = Time.strptime(date, "%d/%b/%Y:%H:%M:%S %Z").to_i

  url = line.split(' ')[6].strip

  out_log_file.puts("#{timestamp},#{method},#{url}\n")
end

out_log_file.close
