module MRuby
  class ArrayPrivate
    include GObject::WrappedType

    def initialize(@m_ruby_array_private)
    end

    def to_unsafe
      @m_ruby_array_private.not_nil!
    end

  end
end

