module Acсessors
  def attr_accessor_with_history(**kwargs)
    kwargs.each do |key, values|
      define_method("#{key}=") do |v|
        if values.include?(v)
        instance_variable_set("@#{key}", v)
        else 
          raise "err #{v}"
        end
      end

      define_method(key) do
        instance_variable_get("@#{key}")
      end
    end
  end

  # def strong_attr_accessor(kwargs, type)

  # end
end


class A
  extend Acсessors
  attr_accessor_with_history person: [:name, :age, :gender]
end

person = A.new


