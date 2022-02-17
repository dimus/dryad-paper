# !/usr/bin/env ruby
# frozen_string_literal: true

require 'find'

files = []
Find.find('.') do |path|
  files << path if path =~ /\.txt$/
end

files.each do |path|
  puts path
  res_path_json = "#{path[0..-4]}json"
  res_path_csv = "#{path[0..-4]}csv"
  puts res_path

  `cat "#{path}" | gnfinder -w 2 -U -l eng -v  -f compact > #{res_path_json}`
  `cat "#{path}" | gnfinder -U -u -l eng -v  -f csv > #{res_path_csv}`
end
