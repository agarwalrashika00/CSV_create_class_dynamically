require_relative './create_class.rb'

class CSVOperations
  def initialize(csv_file)
    @csv_file = csv_file
  end

  def create_class(class_name)
    @class_file_obj = CreateClass.new(class_name)
  end
  
  def add_accessor_methods
    @attributes = CSV.foreach(@csv_file).to_a[0]
    @attributes.each{|attr|
      @class_file_obj.add_accessor_methods(attr)
    }    
  end

  def create_objects
    objects = []
    CSV.foreach(@csv_file, headers: true) do |row|
      obj = @class_file_obj.create_instance
      @attributes.each_with_index{|attribute,i| obj.send("#{attribute}=",row[i])}
      objects << obj
    end
    objects
  end
end