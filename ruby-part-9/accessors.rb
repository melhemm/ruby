module Acсessors
  def attr_accessor_with_history(*args)
    args.each do |arg|
      var_arg = "@#{arg}".to_sym
      define_method(arg) { instance_variable_get(var_arg) }

      define_method("#{arg}".to_sym) do |value|
        instance_variable_set(args, value)
        @history[args] ||= []
        @history[args] << value
      end
      define_method("#{name}_history") { @history[args] }
    end
  end

  def strong_attr_accessor(arg, type)
    var_arg = "@#{arg}".to_sym
    define_method(arg) {instance_variable_get(var_arg)}
  
    define_method("#{arg}=".to_sym) do |value|
      raise "type error" if value.is_a?(type)
      instance_variable_set(var_arg, value)
    end
  end
end