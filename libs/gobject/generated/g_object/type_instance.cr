module GObject
  class TypeInstance
    include GObject::WrappedType

    def initialize(@g_object_type_instance)
    end

    def to_unsafe
      @g_object_type_instance.not_nil!
    end

    def private(private_type)
      __return_value = LibGObject.type_instance_get_private((to_unsafe as LibGObject::TypeInstance*), UInt64.new(private_type))
      __return_value if __return_value
    end

  end
end

