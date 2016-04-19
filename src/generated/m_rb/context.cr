module MRb
  class Context
    include GObject::WrappedType

    def initialize(@m_rb_context)
    end

    def to_unsafe
      @m_rb_context.not_nil!
    end

  end
end

