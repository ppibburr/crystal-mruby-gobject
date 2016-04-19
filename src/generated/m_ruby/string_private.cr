module MRuby
  class StringPrivate
    include GObject::WrappedType

    def initialize(@m_ruby_string_private)
    end

    def to_unsafe
      @m_ruby_string_private.not_nil!
    end

  end
end

