class DynamicClass
  def initialize(csv_file, class_name)
    @csv_file = CSV.read(csv_file, headers: true)
    @class_name = Object.const_set(class_name.capitalize, Class.new)
  end

  def create_instances_dynamically
    add_accessor_methods
    create_objects
  end

  def add_accessor_methods
    @csv_file.headers.each { |attr|
      @class_name.class_eval {attr_accessor attr}
    }
  end

  def create_objects
    objects = []
    @csv_file.each do |row|
      obj = @class_name.new
      @csv_file.headers.each { |attribute| obj.send("#{attribute}=", row[attribute]) }
      objects << obj
    end
    objects
  end
end