require 'csv'
require_relative '../lib/create_class.rb'
require_relative '../lib/csv_operations.rb'

csv_files =  Dir.glob("bin/*.csv")
csv_files.each do |csv_file|
  file_name = csv_file.split(/[\/\.]/)[1]
  
  File.open("#{File.dirname(__FILE__)}/#{file_name}.rb", 'w') do |file_ptr|
    csv_operations = CSVOperations.new("#{File.dirname(__FILE__)}/#{file_name}.csv")
    csv_operations.create_class(file_ptr, file_name)
    csv_operations.add_accessor_methods
    obj_array = csv_operations.create_objects
    obj_array.each{|obj| p obj}
  end
end

