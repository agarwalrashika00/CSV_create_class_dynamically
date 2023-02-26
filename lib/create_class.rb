require_relative '../bin/persons.rb'

class CreateClass
  attr_accessor :class_name
  def initialize(file, class_name)
    @file = file
    @class_name = class_name.capitalize
  end

  def create_class
    @file.puts(%{
  class #{@class_name} 
  end
    })
  end
   
  def add_accessor_methods(attr_names)
    @file.puts(%{
  class #{@class_name}
    attr_accessor *#{attr_names}
  end
  })
  end

  def create_instance
    eval "#{@class_name}.new"
  end
end