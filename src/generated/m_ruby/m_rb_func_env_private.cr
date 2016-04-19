module MRuby
  class MRbFuncEnvPrivate
    include GObject::WrappedType

    def initialize(@m_ruby_m_rb_func_env_private)
    end

    def to_unsafe
      @m_ruby_m_rb_func_env_private.not_nil!
    end

  end
end

