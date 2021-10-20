module Validation
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end
  
  module ClassMethods
    attr_reader :valid

    def validates(name, type, *args)
      @valid ||= []
      @valid.push([name, type, args])
    end
  end

  module InstanceMethods
    def validate!
      self.class.valid.each do |name, type, args|
        errors = []
        var_name = instance_variable_get("@#{name}".to_sym)
        
        case type
        when :presence
          errors << "#{name} can't be nil or empty" if var_name.nil?
        when :format
          errors << "#{name} check data format" if var_name !~ args[0]
        when :type
          errors << "#{name} is not matched" if var_name.instance_of?(args[0])
        end
        raise errors.join(" ") unless errors.empty?
      end
    end

    def valid?
      validate!
      true
    rescue StandardError
      false
    end

  end
end