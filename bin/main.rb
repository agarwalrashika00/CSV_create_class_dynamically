require 'csv'
require_relative '../lib/dynamic_class.rb'

csv_files =  Dir.glob("bin/*.csv")
csv_files.each do |csv_file|
  file_name = File.basename(csv_file).split('.')[0]
  dynamic_class = DynamicClass.new("#{File.dirname(__FILE__)}/#{file_name}.csv", file_name)
  p file_name
  p dynamic_class.create_instances_dynamically
end