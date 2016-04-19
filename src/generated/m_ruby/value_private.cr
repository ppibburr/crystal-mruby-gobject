module MRuby
  class ValuePrivate
    include GObject::WrappedType

    def initialize(@m_ruby_value_private)
    end

    def to_unsafe
      @m_ruby_value_private.not_nil!
    end

  end
end

