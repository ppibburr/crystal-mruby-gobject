module MRuby
  class ModulePrivate
    include GObject::WrappedType

    def initialize(@m_ruby_module_private)
    end

    def to_unsafe
      @m_ruby_module_private.not_nil!
    end

  end
end

