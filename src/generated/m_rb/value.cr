module MRb
  class Value
    include GObject::WrappedType

    def initialize(@m_rb_value)
    end

    def to_unsafe
      @m_rb_value.not_nil!
    end

  end
end

