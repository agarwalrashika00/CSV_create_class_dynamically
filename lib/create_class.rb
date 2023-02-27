# require_relative '../bin/persons.rb'

class CreateClass
  def initialize(class_name)
    @class_name = Object.const_set(class_name.capitalize, Class.new)
  end

  def add_accessor_methods(attr)
    @class_name.class_eval do
      attr_accessor attr
    end
  end

  def create_instance
    eval "#{@class_name}.new"
  end
end