module MRuby
  class ClassPrivate
    include GObject::WrappedType

    def initialize(@m_ruby_class_private)
    end

    def to_unsafe
      @m_ruby_class_private.not_nil!
    end

  end
end

