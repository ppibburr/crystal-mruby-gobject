module MRuby
  class MRbFuncEnv < GObject::Object
    def initialize(@m_ruby_m_rb_func_env)
    end

    def to_unsafe
      @m_ruby_m_rb_func_env.not_nil!
    end

    def self.new_internal(cb : LibMRuby::FuncCB, cb_target)
      __return_value = LibMRuby.m_rb_func_env_new(cb, cb_target && cb_target)
      cast MRuby::MRbFuncEnv.new(__return_value)
    end

  end
end

