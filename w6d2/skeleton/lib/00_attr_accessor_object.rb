class AttrAccessorObject
  def self.my_attr_accessor(*names)
    # ...
    names.each do |method|
      name = "#{method}="
      var = "@#{method}"
      define_method(name) do |val|
        instance_variable_set(var, val)
      end
      define_method(method) do
        instance_variable_get(var)
      end
    end
  end
end
