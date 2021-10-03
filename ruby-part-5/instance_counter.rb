module InstanceCounter

  def self.included(base)
    base.extend(ClassMethods)
    base.send :include, InstanceMethods
  end

  module ClassMethods
    @counter

    attr_accessor :counter

    def instances
      @counter
    end
  end

  module InstanceMethods
    protected

    def register_instance
      self.class.counter += 1
    end
  end

end