module MRuby
  class Context
    include GObject::WrappedType

    def initialize(@m_ruby_context)
    end

    def to_unsafe
      @m_ruby_context.not_nil!
    end

    def define_method(name, cb : LibMRuby::FuncCB, cb_target)
      __return_value = LibMRuby.context_define_method((to_unsafe as LibMRuby::Context*), name, cb, cb_target && cb_target)
      __return_value
    end

    def class_get(name)
      __return_value = LibMRuby.context_class_get((to_unsafe as LibMRuby::Context*), name)
      MRuby::Class.new(__return_value)
    end

    def module_get(name)
      __return_value = LibMRuby.context_module_get((to_unsafe as LibMRuby::Context*), name)
      MRuby::Module.new(__return_value)
    end

    def float_value(val)
      __return_value = LibMRuby.context_float_value((to_unsafe as LibMRuby::Context*), Float32.new(val))
      MRuby::Object.new(__return_value)
    end

    def cptr_value(val)
      __return_value = LibMRuby.context_cptr_value((to_unsafe as LibMRuby::Context*), val && val)
      MRuby::Object.new(__return_value)
    end

    def ary_len(val)
      __return_value = LibMRuby.context_ary_len((to_unsafe as LibMRuby::Context*), (val.to_unsafe as LibMRuby::Value*))
      __return_value
    end

    def obj_new(cls, argv, argv_length1)
      __return_value = LibMRuby.context_obj_new((to_unsafe as LibMRuby::Context*), cls && cls, argv, Int32.new(argv_length1))
      MRuby::Object.new(__return_value)
    end

    def load_string(str)
      __return_value = LibMRuby.context_load_string((to_unsafe as LibMRuby::Context*), str)
      MRuby::Object.new(__return_value)
    end

    def sys_fail(mesg)
      __return_value = LibMRuby.context_sys_fail((to_unsafe as LibMRuby::Context*), mesg)
      __return_value
    end

    def exc_new_str(c, str)
      __return_value = LibMRuby.context_exc_new_str((to_unsafe as LibMRuby::Context*), c && c, (str.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def exc_backtrace(exc)
      __return_value = LibMRuby.context_exc_backtrace((to_unsafe as LibMRuby::Context*), (exc.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def backtrace
      __return_value = LibMRuby.context_get_backtrace((to_unsafe as LibMRuby::Context*))
      MRuby::Object.new(__return_value)
    end

    def f_raise(foo1)
      __return_value = LibMRuby.context_f_raise((to_unsafe as LibMRuby::Context*), (foo1.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def str_concat(foo1, foo2)
      __return_value = LibMRuby.context_str_concat((to_unsafe as LibMRuby::Context*), (foo1.to_unsafe as LibMRuby::Value*), (foo2.to_unsafe as LibMRuby::Value*))
      __return_value
    end

    def str_plus(foo1, foo2)
      __return_value = LibMRuby.context_str_plus((to_unsafe as LibMRuby::Context*), (foo1.to_unsafe as LibMRuby::Value*), (foo2.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def ptr_to_str(foo1)
      __return_value = LibMRuby.context_ptr_to_str((to_unsafe as LibMRuby::Context*), foo1 && foo1)
      MRuby::Object.new(__return_value)
    end

    def obj_as_string(obj)
      __return_value = LibMRuby.context_obj_as_string((to_unsafe as LibMRuby::Context*), (obj.to_unsafe as LibMRuby::Value*))
      MRuby::String.new(__return_value)
    end

    def str_resize(str, len)
      __return_value = LibMRuby.context_str_resize((to_unsafe as LibMRuby::Context*), (str.to_unsafe as LibMRuby::Value*), Int32.new(len))
      MRuby::Object.new(__return_value)
    end

    def str_substr(str, beg, len)
      __return_value = LibMRuby.context_str_substr((to_unsafe as LibMRuby::Context*), (str.to_unsafe as LibMRuby::Value*), Int32.new(beg), Int32.new(len))
      MRuby::Object.new(__return_value)
    end

    def string_type(str)
      __return_value = LibMRuby.context_string_type((to_unsafe as LibMRuby::Context*), (str.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def check_string_type(str)
      __return_value = LibMRuby.context_check_string_type((to_unsafe as LibMRuby::Context*), (str.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def str_buf_new(capa)
      __return_value = LibMRuby.context_str_buf_new((to_unsafe as LibMRuby::Context*), UInt64.new(capa))
      MRuby::Object.new(__return_value)
    end

    def string_value_ptr(ptr)
      __return_value = LibMRuby.context_string_value_ptr((to_unsafe as LibMRuby::Context*), (ptr.to_unsafe as LibMRuby::Value*))
      (raise "Expected string but got null" unless __return_value; String.new(__return_value))
    end

    def str_dup(str)
      __return_value = LibMRuby.context_str_dup((to_unsafe as LibMRuby::Context*), (str.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def str_intern(self)
      __return_value = LibMRuby.context_str_intern((to_unsafe as LibMRuby::Context*), (self.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def str_to_inum(str, _base, badcheck)
      __return_value = LibMRuby.context_str_to_inum((to_unsafe as LibMRuby::Context*), (str.to_unsafe as LibMRuby::Value*), Int32.new(_base), badcheck)
      MRuby::Object.new(__return_value)
    end

    def str_to_str(str)
      __return_value = LibMRuby.context_str_to_str((to_unsafe as LibMRuby::Context*), (str.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def str_equal(str1, str2)
      __return_value = LibMRuby.context_str_equal((to_unsafe as LibMRuby::Context*), (str1.to_unsafe as LibMRuby::Value*), (str2.to_unsafe as LibMRuby::Value*))
      __return_value
    end

    def str_cat(str, ptr, len)
      __return_value = LibMRuby.context_str_cat((to_unsafe as LibMRuby::Context*), (str.to_unsafe as LibMRuby::Value*), ptr, UInt64.new(len))
      MRuby::Object.new(__return_value)
    end

    def str_cat_cstr(str, ptr)
      __return_value = LibMRuby.context_str_cat_cstr((to_unsafe as LibMRuby::Context*), (str.to_unsafe as LibMRuby::Value*), ptr)
      MRuby::Object.new(__return_value)
    end

    def str_cat_str(str, str2)
      __return_value = LibMRuby.context_str_cat_str((to_unsafe as LibMRuby::Context*), (str.to_unsafe as LibMRuby::Value*), (str2.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def str_append(str, str2)
      __return_value = LibMRuby.context_str_append((to_unsafe as LibMRuby::Context*), (str.to_unsafe as LibMRuby::Value*), (str2.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def str_to_cstr(str)
      __return_value = LibMRuby.context_str_to_cstr((to_unsafe as LibMRuby::Context*), (str.to_unsafe as LibMRuby::Value*))
      __return_value
    end

    def str_pool(str)
      __return_value = LibMRuby.context_str_pool((to_unsafe as LibMRuby::Context*), (str.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def str_hash(str)
      __return_value = LibMRuby.context_str_hash((to_unsafe as LibMRuby::Context*), (str.to_unsafe as LibMRuby::Value*))
      __return_value
    end

    def str_dump(str)
      __return_value = LibMRuby.context_str_dump((to_unsafe as LibMRuby::Context*), (str.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def str_inspect(str)
      __return_value = LibMRuby.context_str_inspect((to_unsafe as LibMRuby::Context*), (str.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def noregexp(self)
      __return_value = LibMRuby.context_noregexp((to_unsafe as LibMRuby::Context*), (self.to_unsafe as LibMRuby::Value*))
      __return_value
    end

    def regexp_check(obj)
      __return_value = LibMRuby.context_regexp_check((to_unsafe as LibMRuby::Context*), (obj.to_unsafe as LibMRuby::Value*))
      __return_value
    end

    def range_new(foo1, foo2, foo3)
      __return_value = LibMRuby.context_range_new((to_unsafe as LibMRuby::Context*), (foo1.to_unsafe as LibMRuby::Value*), (foo2.to_unsafe as LibMRuby::Value*), foo3)
      MRuby::Object.new(__return_value)
    end

    def define_class_id(foo1, foo2)
      __return_value = LibMRuby.context_define_class_id((to_unsafe as LibMRuby::Context*), foo1, foo2 && foo2)
      __return_value
    end

    def define_module_id(foo1)
      __return_value = LibMRuby.context_define_module_id((to_unsafe as LibMRuby::Context*), foo1)
      __return_value
    end

    def vm_define_class(foo1, foo2, foo3)
      __return_value = LibMRuby.context_vm_define_class((to_unsafe as LibMRuby::Context*), (foo1.to_unsafe as LibMRuby::Value*), (foo2.to_unsafe as LibMRuby::Value*), foo3)
      __return_value
    end

    def vm_define_module(foo1, foo2)
      __return_value = LibMRuby.context_vm_define_module((to_unsafe as LibMRuby::Context*), (foo1.to_unsafe as LibMRuby::Value*), foo2)
      __return_value
    end

    def define_method_raw(foo1, foo2, foo3)
      __return_value = LibMRuby.context_define_method_raw((to_unsafe as LibMRuby::Context*), foo1 && foo1, foo2, foo3 && foo3)
      __return_value
    end

    def define_method_id(c, mid, func, aspec)
      __return_value = LibMRuby.context_define_method_id((to_unsafe as LibMRuby::Context*), c && c, mid, func, UInt32.new(aspec))
      __return_value
    end

    def alias_method(c, a, b)
      __return_value = LibMRuby.context_alias_method((to_unsafe as LibMRuby::Context*), c && c, a, b)
      __return_value
    end

    def class_outer_module(foo1)
      __return_value = LibMRuby.context_class_outer_module((to_unsafe as LibMRuby::Context*), foo1 && foo1)
      __return_value
    end

    def method_search(foo1, foo2)
      __return_value = LibMRuby.context_method_search((to_unsafe as LibMRuby::Context*), foo1 && foo1, foo2)
      __return_value
    end

    def gc_mark_mt(foo1)
      __return_value = LibMRuby.context_gc_mark_mt((to_unsafe as LibMRuby::Context*), foo1 && foo1)
      __return_value
    end

    def gc_mark_mt_size(foo1)
      __return_value = LibMRuby.context_gc_mark_mt_size((to_unsafe as LibMRuby::Context*), foo1 && foo1)
      __return_value
    end

    def gc_free_mt(foo1)
      __return_value = LibMRuby.context_gc_free_mt((to_unsafe as LibMRuby::Context*), foo1 && foo1)
      __return_value
    end

    def flo_to_fixnum(val)
      __return_value = LibMRuby.context_flo_to_fixnum((to_unsafe as LibMRuby::Context*), (val.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def float_to_str(x, fmt)
      __return_value = LibMRuby.context_float_to_str((to_unsafe as LibMRuby::Context*), (x.to_unsafe as LibMRuby::Value*), fmt)
      MRuby::Object.new(__return_value)
    end

    def to_flo(x)
      __return_value = LibMRuby.context_to_flo((to_unsafe as LibMRuby::Context*), (x.to_unsafe as LibMRuby::Value*))
      __return_value
    end

    def fixnum_plus(x, y)
      __return_value = LibMRuby.context_fixnum_plus((to_unsafe as LibMRuby::Context*), (x.to_unsafe as LibMRuby::Value*), (y.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def fixnum_minus(x, y)
      __return_value = LibMRuby.context_fixnum_minus((to_unsafe as LibMRuby::Context*), (x.to_unsafe as LibMRuby::Value*), (y.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def fixnum_mul(x, y)
      __return_value = LibMRuby.context_fixnum_mul((to_unsafe as LibMRuby::Context*), (x.to_unsafe as LibMRuby::Value*), (y.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def num_div(x, y)
      __return_value = LibMRuby.context_num_div((to_unsafe as LibMRuby::Context*), (x.to_unsafe as LibMRuby::Value*), (y.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def proc_new_cfunc(foo1)
      __return_value = LibMRuby.context_proc_new_cfunc((to_unsafe as LibMRuby::Context*), foo1)
      __return_value
    end

    def f_send(self)
      __return_value = LibMRuby.context_f_send((to_unsafe as LibMRuby::Context*), (self.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def proc_cfunc_env_get(foo1)
      __return_value = LibMRuby.context_proc_cfunc_env_get((to_unsafe as LibMRuby::Context*), Int32.new(foo1))
      MRuby::Object.new(__return_value)
    end

    def ary_new_capa(foo1)
      __return_value = LibMRuby.context_ary_new_capa((to_unsafe as LibMRuby::Context*), Int32.new(foo1))
      MRuby::Object.new(__return_value)
    end

    def ary_new
      __return_value = LibMRuby.context_ary_new((to_unsafe as LibMRuby::Context*))
      MRuby::Array.new(__return_value)
    end

    def ary_new_from_values(size, vals, vals_length1)
      __return_value = LibMRuby.context_ary_new_from_values((to_unsafe as LibMRuby::Context*), Int32.new(size), vals, Int32.new(vals_length1))
      MRuby::Array.new(__return_value)
    end

    def assoc_new(car, cdr)
      __return_value = LibMRuby.context_assoc_new((to_unsafe as LibMRuby::Context*), (car.to_unsafe as LibMRuby::Value*), (cdr.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def ary_concat(foo1, foo2)
      __return_value = LibMRuby.context_ary_concat((to_unsafe as LibMRuby::Context*), (foo1.to_unsafe as LibMRuby::Value*), (foo2.to_unsafe as LibMRuby::Value*))
      __return_value
    end

    def ary_splat(foo1)
      __return_value = LibMRuby.context_ary_splat((to_unsafe as LibMRuby::Context*), (foo1.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def ary_push(foo1, foo2)
      __return_value = LibMRuby.context_ary_push((to_unsafe as LibMRuby::Context*), (foo1.to_unsafe as LibMRuby::Value*), (foo2.to_unsafe as LibMRuby::Value*))
      __return_value
    end

    def ary_pop(ary)
      __return_value = LibMRuby.context_ary_pop((to_unsafe as LibMRuby::Context*), (ary.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def ary_ref(ary, n)
      __return_value = LibMRuby.context_ary_ref((to_unsafe as LibMRuby::Context*), (ary.to_unsafe as LibMRuby::Value*), Int32.new(n))
      MRuby::Object.new(__return_value)
    end

    def ary_set(ary, n, val)
      __return_value = LibMRuby.context_ary_set((to_unsafe as LibMRuby::Context*), (ary.to_unsafe as LibMRuby::Value*), Int32.new(n), (val.to_unsafe as LibMRuby::Value*))
      __return_value
    end

    def ary_replace(a, b)
      __return_value = LibMRuby.context_ary_replace((to_unsafe as LibMRuby::Context*), (a.to_unsafe as LibMRuby::Value*), (b.to_unsafe as LibMRuby::Value*))
      __return_value
    end

    def check_array_type(self)
      __return_value = LibMRuby.context_check_array_type((to_unsafe as LibMRuby::Context*), (self.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def ary_unshift(self, item)
      __return_value = LibMRuby.context_ary_unshift((to_unsafe as LibMRuby::Context*), (self.to_unsafe as LibMRuby::Value*), (item.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def ary_shift(self)
      __return_value = LibMRuby.context_ary_shift((to_unsafe as LibMRuby::Context*), (self.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def ary_clear(self)
      __return_value = LibMRuby.context_ary_clear((to_unsafe as LibMRuby::Context*), (self.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def ary_join(ary, sep)
      __return_value = LibMRuby.context_ary_join((to_unsafe as LibMRuby::Context*), (ary.to_unsafe as LibMRuby::Value*), (sep.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def ary_resize(ary, len)
      __return_value = LibMRuby.context_ary_resize((to_unsafe as LibMRuby::Context*), (ary.to_unsafe as LibMRuby::Value*), Int32.new(len))
      MRuby::Object.new(__return_value)
    end

    def hash_new
      __return_value = LibMRuby.context_hash_new((to_unsafe as LibMRuby::Context*))
      MRuby::Object.new(__return_value)
    end

    def hash_set(hash, key, val)
      __return_value = LibMRuby.context_hash_set((to_unsafe as LibMRuby::Context*), (hash.to_unsafe as LibMRuby::Value*), (key.to_unsafe as LibMRuby::Value*), (val.to_unsafe as LibMRuby::Value*))
      __return_value
    end

    def hash_get(hash, key)
      __return_value = LibMRuby.context_hash_get((to_unsafe as LibMRuby::Context*), (hash.to_unsafe as LibMRuby::Value*), (key.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def hash_fetch(hash, key, _def)
      __return_value = LibMRuby.context_hash_fetch((to_unsafe as LibMRuby::Context*), (hash.to_unsafe as LibMRuby::Value*), (key.to_unsafe as LibMRuby::Value*), (_def.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def hash_delete_key(hash, key)
      __return_value = LibMRuby.context_hash_delete_key((to_unsafe as LibMRuby::Context*), (hash.to_unsafe as LibMRuby::Value*), (key.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def hash_keys(hash)
      __return_value = LibMRuby.context_hash_keys((to_unsafe as LibMRuby::Context*), (hash.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def check_hash_type(hash)
      __return_value = LibMRuby.context_check_hash_type((to_unsafe as LibMRuby::Context*), (hash.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def hash_empty_p(self)
      __return_value = LibMRuby.context_hash_empty_p((to_unsafe as LibMRuby::Context*), (self.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def hash_clear(hash)
      __return_value = LibMRuby.context_hash_clear((to_unsafe as LibMRuby::Context*), (hash.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def vm_special_get(foo1)
      __return_value = LibMRuby.context_vm_special_get((to_unsafe as LibMRuby::Context*), foo1)
      MRuby::Object.new(__return_value)
    end

    def vm_special_set(foo1, foo2)
      __return_value = LibMRuby.context_vm_special_set((to_unsafe as LibMRuby::Context*), foo1, (foo2.to_unsafe as LibMRuby::Value*))
      __return_value
    end

    def vm_iv_get(foo1)
      __return_value = LibMRuby.context_vm_iv_get((to_unsafe as LibMRuby::Context*), foo1)
      MRuby::Object.new(__return_value)
    end

    def vm_iv_set(foo1, foo2)
      __return_value = LibMRuby.context_vm_iv_set((to_unsafe as LibMRuby::Context*), foo1, (foo2.to_unsafe as LibMRuby::Value*))
      __return_value
    end

    def vm_cv_get(foo1)
      __return_value = LibMRuby.context_vm_cv_get((to_unsafe as LibMRuby::Context*), foo1)
      MRuby::Object.new(__return_value)
    end

    def vm_cv_set(foo1, foo2)
      __return_value = LibMRuby.context_vm_cv_set((to_unsafe as LibMRuby::Context*), foo1, (foo2.to_unsafe as LibMRuby::Value*))
      __return_value
    end

    def vm_const_get(foo1)
      __return_value = LibMRuby.context_vm_const_get((to_unsafe as LibMRuby::Context*), foo1)
      MRuby::Object.new(__return_value)
    end

    def vm_const_set(foo1, foo2)
      __return_value = LibMRuby.context_vm_const_set((to_unsafe as LibMRuby::Context*), foo1, (foo2.to_unsafe as LibMRuby::Value*))
      __return_value
    end

    def const_get(foo1, foo2)
      __return_value = LibMRuby.context_const_get((to_unsafe as LibMRuby::Context*), (foo1.to_unsafe as LibMRuby::Value*), foo2)
      MRuby::Object.new(__return_value)
    end

    def const_set(foo1, foo2, foo3)
      __return_value = LibMRuby.context_const_set((to_unsafe as LibMRuby::Context*), (foo1.to_unsafe as LibMRuby::Value*), foo2, (foo3.to_unsafe as LibMRuby::Value*))
      __return_value
    end

    def const_defined(foo1, foo2)
      __return_value = LibMRuby.context_const_defined((to_unsafe as LibMRuby::Context*), (foo1.to_unsafe as LibMRuby::Value*), foo2)
      __return_value
    end

    def const_remove(foo1, foo2)
      __return_value = LibMRuby.context_const_remove((to_unsafe as LibMRuby::Context*), (foo1.to_unsafe as LibMRuby::Value*), foo2)
      __return_value
    end

    def iv_p(sym)
      __return_value = LibMRuby.context_iv_p((to_unsafe as LibMRuby::Context*), sym)
      __return_value
    end

    def iv_check(sym)
      __return_value = LibMRuby.context_iv_check((to_unsafe as LibMRuby::Context*), sym)
      __return_value
    end

    def iv_get(obj, sym)
      __return_value = LibMRuby.context_iv_get((to_unsafe as LibMRuby::Context*), (obj.to_unsafe as LibMRuby::Value*), sym)
      MRuby::Object.new(__return_value)
    end

    def iv_set(obj, sym, v)
      __return_value = LibMRuby.context_iv_set((to_unsafe as LibMRuby::Context*), (obj.to_unsafe as LibMRuby::Value*), sym, (v.to_unsafe as LibMRuby::Value*))
      __return_value
    end

    def iv_defined(foo1, foo2)
      __return_value = LibMRuby.context_iv_defined((to_unsafe as LibMRuby::Context*), (foo1.to_unsafe as LibMRuby::Value*), foo2)
      __return_value
    end

    def iv_remove(obj, sym)
      __return_value = LibMRuby.context_iv_remove((to_unsafe as LibMRuby::Context*), (obj.to_unsafe as LibMRuby::Value*), sym)
      MRuby::Object.new(__return_value)
    end

    def iv_copy(dst, src)
      __return_value = LibMRuby.context_iv_copy((to_unsafe as LibMRuby::Context*), (dst.to_unsafe as LibMRuby::Value*), (src.to_unsafe as LibMRuby::Value*))
      __return_value
    end

    def const_defined_at(mod, id)
      __return_value = LibMRuby.context_const_defined_at((to_unsafe as LibMRuby::Context*), (mod.to_unsafe as LibMRuby::Value*), id)
      __return_value
    end

    def gv_get(sym)
      __return_value = LibMRuby.context_gv_get((to_unsafe as LibMRuby::Context*), sym)
      MRuby::Object.new(__return_value)
    end

    def gv_set(sym, val)
      __return_value = LibMRuby.context_gv_set((to_unsafe as LibMRuby::Context*), sym, (val.to_unsafe as LibMRuby::Value*))
      __return_value
    end

    def gv_remove(sym)
      __return_value = LibMRuby.context_gv_remove((to_unsafe as LibMRuby::Context*), sym)
      __return_value
    end

    def cv_get(mod, sym)
      __return_value = LibMRuby.context_cv_get((to_unsafe as LibMRuby::Context*), (mod.to_unsafe as LibMRuby::Value*), sym)
      MRuby::Object.new(__return_value)
    end

    def cv_set(mod, sym, v)
      __return_value = LibMRuby.context_cv_set((to_unsafe as LibMRuby::Context*), (mod.to_unsafe as LibMRuby::Value*), sym, (v.to_unsafe as LibMRuby::Value*))
      __return_value
    end

    def cv_defined(mod, sym)
      __return_value = LibMRuby.context_cv_defined((to_unsafe as LibMRuby::Context*), (mod.to_unsafe as LibMRuby::Value*), sym)
      __return_value
    end

    def mod_constants(mod)
      __return_value = LibMRuby.context_mod_constants((to_unsafe as LibMRuby::Context*), (mod.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def f_global_variables(self)
      __return_value = LibMRuby.context_f_global_variables((to_unsafe as LibMRuby::Context*), (self.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def obj_instance_variables(foo1)
      __return_value = LibMRuby.context_obj_instance_variables((to_unsafe as LibMRuby::Context*), (foo1.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def mod_class_variables(foo1)
      __return_value = LibMRuby.context_mod_class_variables((to_unsafe as LibMRuby::Context*), (foo1.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def class_sym(c, outer)
      __return_value = LibMRuby.context_class_sym((to_unsafe as LibMRuby::Context*), c && c, outer && outer)
      MRuby::Symbol.new(__return_value)
    end

    def gc_mark_gv
      __return_value = LibMRuby.context_gc_mark_gv((to_unsafe as LibMRuby::Context*))
      __return_value
    end

    def gc_free_gv
      __return_value = LibMRuby.context_gc_free_gv((to_unsafe as LibMRuby::Context*))
      __return_value
    end

    def define_class(foo1, foo2)
      __return_value = LibMRuby.context_define_class((to_unsafe as LibMRuby::Context*), foo1, foo2 && foo2)
      __return_value
    end

    def define_module(foo1)
      __return_value = LibMRuby.context_define_module((to_unsafe as LibMRuby::Context*), foo1)
      __return_value
    end

    def singleton_class(foo1)
      __return_value = LibMRuby.context_singleton_class((to_unsafe as LibMRuby::Context*), (foo1.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def include_module(foo1, foo2)
      __return_value = LibMRuby.context_include_module((to_unsafe as LibMRuby::Context*), foo1 && foo1, foo2 && foo2)
      __return_value
    end

    def define_class_method(foo1, foo2, foo3, foo4)
      __return_value = LibMRuby.context_define_class_method((to_unsafe as LibMRuby::Context*), foo1 && foo1, foo2, foo3, UInt32.new(foo4))
      __return_value
    end

    def define_module_function(foo1, foo2, foo3, foo4)
      __return_value = LibMRuby.context_define_module_function((to_unsafe as LibMRuby::Context*), foo1 && foo1, foo2, foo3, UInt32.new(foo4))
      __return_value
    end

    def define_const(foo1, name, foo2)
      __return_value = LibMRuby.context_define_const((to_unsafe as LibMRuby::Context*), foo1 && foo1, name, (foo2.to_unsafe as LibMRuby::Value*))
      __return_value
    end

    def undef_method(foo1, foo2)
      __return_value = LibMRuby.context_undef_method((to_unsafe as LibMRuby::Context*), foo1 && foo1, foo2)
      __return_value
    end

    def undef_class_method(foo1, foo2)
      __return_value = LibMRuby.context_undef_class_method((to_unsafe as LibMRuby::Context*), foo1 && foo1, foo2)
      __return_value
    end

    def instance_new(cv)
      __return_value = LibMRuby.context_instance_new((to_unsafe as LibMRuby::Context*), (cv.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def class_new(super)
      __return_value = LibMRuby.context_class_new((to_unsafe as LibMRuby::Context*), super && super)
      __return_value
    end

    def module_new
      __return_value = LibMRuby.context_module_new((to_unsafe as LibMRuby::Context*))
      __return_value
    end

    def class_defined(name)
      __return_value = LibMRuby.context_class_defined((to_unsafe as LibMRuby::Context*), name)
      __return_value
    end

    def class_get_under(outer, name)
      __return_value = LibMRuby.context_class_get_under((to_unsafe as LibMRuby::Context*), outer && outer, name)
      __return_value
    end

    def module_get_under(outer, name)
      __return_value = LibMRuby.context_module_get_under((to_unsafe as LibMRuby::Context*), outer && outer, name)
      __return_value
    end

    def notimplement_m(foo1)
      __return_value = LibMRuby.context_notimplement_m((to_unsafe as LibMRuby::Context*), (foo1.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def obj_dup(obj)
      __return_value = LibMRuby.context_obj_dup((to_unsafe as LibMRuby::Context*), (obj.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def check_to_integer(val, method)
      __return_value = LibMRuby.context_check_to_integer((to_unsafe as LibMRuby::Context*), (val.to_unsafe as LibMRuby::Value*), method)
      MRuby::Object.new(__return_value)
    end

    def obj_respond_to(c, mid)
      __return_value = LibMRuby.context_obj_respond_to((to_unsafe as LibMRuby::Context*), c && c, mid)
      __return_value
    end

    def define_class_under(outer, name, super)
      __return_value = LibMRuby.context_define_class_under((to_unsafe as LibMRuby::Context*), outer && outer, name, super && super)
      __return_value
    end

    def define_module_under(outer, name)
      __return_value = LibMRuby.context_define_module_under((to_unsafe as LibMRuby::Context*), outer && outer, name)
      __return_value
    end

    def funcall_argv(foo1, foo2, foo3, foo4, foo4_length1)
      __return_value = LibMRuby.context_funcall_argv((to_unsafe as LibMRuby::Context*), (foo1.to_unsafe as LibMRuby::Value*), foo2, Int32.new(foo3), foo4, Int32.new(foo4_length1))
      MRuby::Object.new(__return_value)
    end

    def funcall_with_block(foo1, foo2, foo3, foo4, foo4_length1, foo5)
      __return_value = LibMRuby.context_funcall_with_block((to_unsafe as LibMRuby::Context*), (foo1.to_unsafe as LibMRuby::Value*), foo2, Int32.new(foo3), foo4, Int32.new(foo4_length1), (foo5.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def intern_cstr(foo1)
      __return_value = LibMRuby.context_intern_cstr((to_unsafe as LibMRuby::Context*), foo1)
      MRuby::Symbol.new(__return_value)
    end

    def intern(foo1, foo2)
      __return_value = LibMRuby.context_intern((to_unsafe as LibMRuby::Context*), foo1, UInt64.new(foo2))
      MRuby::Symbol.new(__return_value)
    end

    def intern_static(foo1, foo2)
      __return_value = LibMRuby.context_intern_static((to_unsafe as LibMRuby::Context*), foo1, UInt64.new(foo2))
      MRuby::Symbol.new(__return_value)
    end

    def intern_str(foo1)
      __return_value = LibMRuby.context_intern_str((to_unsafe as LibMRuby::Context*), (foo1.to_unsafe as LibMRuby::Value*))
      MRuby::Symbol.new(__return_value)
    end

    def check_intern_cstr(foo1)
      __return_value = LibMRuby.context_check_intern_cstr((to_unsafe as LibMRuby::Context*), foo1)
      MRuby::Object.new(__return_value)
    end

    def check_intern(foo1, foo2)
      __return_value = LibMRuby.context_check_intern((to_unsafe as LibMRuby::Context*), foo1, UInt64.new(foo2))
      MRuby::Object.new(__return_value)
    end

    def check_intern_str(foo1)
      __return_value = LibMRuby.context_check_intern_str((to_unsafe as LibMRuby::Context*), (foo1.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def sym2name(foo1)
      __return_value = LibMRuby.context_sym2name((to_unsafe as LibMRuby::Context*), foo1)
      (raise "Expected string but got null" unless __return_value; String.new(__return_value))
    end

    def sym2str(foo1)
      __return_value = LibMRuby.context_sym2str((to_unsafe as LibMRuby::Context*), foo1)
      MRuby::Object.new(__return_value)
    end

    def malloc(foo1)
      __return_value = LibMRuby.context_malloc((to_unsafe as LibMRuby::Context*), UInt64.new(foo1))
      __return_value
    end

    def calloc(foo1, foo2)
      __return_value = LibMRuby.context_calloc((to_unsafe as LibMRuby::Context*), UInt64.new(foo1), UInt64.new(foo2))
      __return_value
    end

    def realloc(foo1, foo2)
      __return_value = LibMRuby.context_realloc((to_unsafe as LibMRuby::Context*), foo1 && foo1, UInt64.new(foo2))
      __return_value
    end

    def realloc_simple(foo1, foo2)
      __return_value = LibMRuby.context_realloc_simple((to_unsafe as LibMRuby::Context*), foo1 && foo1, UInt64.new(foo2))
      __return_value
    end

    def malloc_simple(foo1)
      __return_value = LibMRuby.context_malloc_simple((to_unsafe as LibMRuby::Context*), UInt64.new(foo1))
      __return_value
    end

    def free(foo1)
      __return_value = LibMRuby.context_free((to_unsafe as LibMRuby::Context*), foo1 && foo1)
      __return_value
    end

    def str_new(p, len)
      __return_value = LibMRuby.context_str_new((to_unsafe as LibMRuby::Context*), p, UInt64.new(len))
      MRuby::Object.new(__return_value)
    end

    def str_new_cstr(foo1)
      __return_value = LibMRuby.context_str_new_cstr((to_unsafe as LibMRuby::Context*), foo1)
      MRuby::String.new(__return_value)
    end

    def str_new_static(p, len)
      __return_value = LibMRuby.context_str_new_static((to_unsafe as LibMRuby::Context*), p, UInt64.new(len))
      MRuby::Object.new(__return_value)
    end

    def close
      __return_value = LibMRuby.context_close((to_unsafe as LibMRuby::Context*))
      __return_value
    end

    def default_allocf(foo1, foo2, foo3)
      __return_value = LibMRuby.context_default_allocf((to_unsafe as LibMRuby::Context*), foo1 && foo1, UInt64.new(foo2), foo3 && foo3)
      __return_value
    end

    def top_self
      __return_value = LibMRuby.context_top_self((to_unsafe as LibMRuby::Context*))
      MRuby::Object.new(__return_value)
    end

    def run(foo1, foo2)
      __return_value = LibMRuby.context_run((to_unsafe as LibMRuby::Context*), foo1 && foo1, (foo2.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def toplevel_run(foo1)
      __return_value = LibMRuby.context_toplevel_run((to_unsafe as LibMRuby::Context*), foo1 && foo1)
      MRuby::Object.new(__return_value)
    end

    def p(foo1)
      __return_value = LibMRuby.context_p((to_unsafe as LibMRuby::Context*), (foo1.to_unsafe as LibMRuby::Value*))
      __return_value
    end

    def obj_to_sym(name)
      __return_value = LibMRuby.context_obj_to_sym((to_unsafe as LibMRuby::Context*), (name.to_unsafe as LibMRuby::Value*))
      MRuby::Symbol.new(__return_value)
    end

    def obj_eq(foo1, foo2)
      __return_value = LibMRuby.context_obj_eq((to_unsafe as LibMRuby::Context*), (foo1.to_unsafe as LibMRuby::Value*), (foo2.to_unsafe as LibMRuby::Value*))
      __return_value
    end

    def obj_equal(foo1, foo2)
      __return_value = LibMRuby.context_obj_equal((to_unsafe as LibMRuby::Context*), (foo1.to_unsafe as LibMRuby::Value*), (foo2.to_unsafe as LibMRuby::Value*))
      __return_value
    end

    def equal(obj1, obj2)
      __return_value = LibMRuby.context_equal((to_unsafe as LibMRuby::Context*), (obj1.to_unsafe as LibMRuby::Value*), (obj2.to_unsafe as LibMRuby::Value*))
      __return_value
    end

    def integer(val)
      __return_value = LibMRuby.context_Integer((to_unsafe as LibMRuby::Context*), (val.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def float(val)
      __return_value = LibMRuby.context_Float((to_unsafe as LibMRuby::Context*), (val.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def inspect(obj)
      __return_value = LibMRuby.context_inspect((to_unsafe as LibMRuby::Context*), (obj.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def eql(obj1, obj2)
      __return_value = LibMRuby.context_eql((to_unsafe as LibMRuby::Context*), (obj1.to_unsafe as LibMRuby::Value*), (obj2.to_unsafe as LibMRuby::Value*))
      __return_value
    end

    def garbage_collect
      __return_value = LibMRuby.context_garbage_collect((to_unsafe as LibMRuby::Context*))
      __return_value
    end

    def full_gc
      __return_value = LibMRuby.context_full_gc((to_unsafe as LibMRuby::Context*))
      __return_value
    end

    def incremental_gc
      __return_value = LibMRuby.context_incremental_gc((to_unsafe as LibMRuby::Context*))
      __return_value
    end

    def any_to_s(obj)
      __return_value = LibMRuby.context_any_to_s((to_unsafe as LibMRuby::Context*), (obj.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def obj_classname(obj)
      __return_value = LibMRuby.context_obj_classname((to_unsafe as LibMRuby::Context*), (obj.to_unsafe as LibMRuby::Value*))
      (raise "Expected string but got null" unless __return_value; String.new(__return_value))
    end

    def obj_class(obj)
      __return_value = LibMRuby.context_obj_class((to_unsafe as LibMRuby::Context*), (obj.to_unsafe as LibMRuby::Value*))
      __return_value
    end

    def class_path(c)
      __return_value = LibMRuby.context_class_path((to_unsafe as LibMRuby::Context*), c && c)
      MRuby::Object.new(__return_value)
    end

    def obj_is_kind_of(obj, c)
      __return_value = LibMRuby.context_obj_is_kind_of((to_unsafe as LibMRuby::Context*), (obj.to_unsafe as LibMRuby::Value*), c && c)
      __return_value
    end

    def obj_inspect(self)
      __return_value = LibMRuby.context_obj_inspect((to_unsafe as LibMRuby::Context*), (self.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def obj_clone(self)
      __return_value = LibMRuby.context_obj_clone((to_unsafe as LibMRuby::Context*), (self.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def exc_new(c, ptr, len)
      __return_value = LibMRuby.context_exc_new((to_unsafe as LibMRuby::Context*), c && c, ptr, UInt64.new(len))
      MRuby::Object.new(__return_value)
    end

    def print_backtrace
      __return_value = LibMRuby.context_print_backtrace((to_unsafe as LibMRuby::Context*))
      __return_value
    end

    def print_error
      __return_value = LibMRuby.context_print_error((to_unsafe as LibMRuby::Context*))
      __return_value
    end

    def yield(b, arg)
      __return_value = LibMRuby.context_yield((to_unsafe as LibMRuby::Context*), (b.to_unsafe as LibMRuby::Value*), (arg.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def yield_argv(b, argc, argv, argv_length1)
      __return_value = LibMRuby.context_yield_argv((to_unsafe as LibMRuby::Context*), (b.to_unsafe as LibMRuby::Value*), Int32.new(argc), argv, Int32.new(argv_length1))
      MRuby::Object.new(__return_value)
    end

    def yield_with_class(b, argc, argv, argv_length1, self, c)
      __return_value = LibMRuby.context_yield_with_class((to_unsafe as LibMRuby::Context*), (b.to_unsafe as LibMRuby::Value*), Int32.new(argc), argv, Int32.new(argv_length1), (self.to_unsafe as LibMRuby::Value*), c && c)
      MRuby::Object.new(__return_value)
    end

    def gc_protect(obj)
      __return_value = LibMRuby.context_gc_protect((to_unsafe as LibMRuby::Context*), (obj.to_unsafe as LibMRuby::Value*))
      __return_value
    end

    def to_int(val)
      __return_value = LibMRuby.context_to_int((to_unsafe as LibMRuby::Context*), (val.to_unsafe as LibMRuby::Value*))
      MRuby::Object.new(__return_value)
    end

    def define_alias(klass, name1, name2)
      __return_value = LibMRuby.context_define_alias((to_unsafe as LibMRuby::Context*), klass && klass, name1, name2)
      __return_value
    end

    def class_name(klass)
      __return_value = LibMRuby.context_class_name((to_unsafe as LibMRuby::Context*), klass && klass)
      (raise "Expected string but got null" unless __return_value; String.new(__return_value))
    end

    def define_global_const(name, val)
      __return_value = LibMRuby.context_define_global_const((to_unsafe as LibMRuby::Context*), name, (val.to_unsafe as LibMRuby::Value*))
      __return_value
    end

    def attr_get(obj, id)
      __return_value = LibMRuby.context_attr_get((to_unsafe as LibMRuby::Context*), (obj.to_unsafe as LibMRuby::Value*), id)
      MRuby::Object.new(__return_value)
    end

    def respond_to(obj, mid)
      __return_value = LibMRuby.context_respond_to((to_unsafe as LibMRuby::Context*), (obj.to_unsafe as LibMRuby::Value*), mid)
      __return_value
    end

    def obj_is_instance_of(obj, c)
      __return_value = LibMRuby.context_obj_is_instance_of((to_unsafe as LibMRuby::Context*), (obj.to_unsafe as LibMRuby::Value*), c && c)
      __return_value
    end

    def fiber_resume(fib, argc, argv, argv_length1)
      __return_value = LibMRuby.context_fiber_resume((to_unsafe as LibMRuby::Context*), (fib.to_unsafe as LibMRuby::Value*), Int32.new(argc), argv, Int32.new(argv_length1))
      MRuby::Object.new(__return_value)
    end

    def fiber_yield(argc, argv, argv_length1)
      __return_value = LibMRuby.context_fiber_yield((to_unsafe as LibMRuby::Context*), Int32.new(argc), argv, Int32.new(argv_length1))
      MRuby::Object.new(__return_value)
    end

    def alloca(foo1)
      __return_value = LibMRuby.context_alloca((to_unsafe as LibMRuby::Context*), UInt64.new(foo1))
      __return_value
    end

    def show_version
      __return_value = LibMRuby.context_show_version((to_unsafe as LibMRuby::Context*))
      __return_value
    end

    def show_copyright
      __return_value = LibMRuby.context_show_copyright((to_unsafe as LibMRuby::Context*))
      __return_value
    end

    def self.new_internal
      __return_value = LibMRuby.context_new
      cast MRuby::Context.new(__return_value)
    end

    def _base_
      __return_value = LibMRuby.context_get__base_((to_unsafe as LibMRuby::Context*))
      MRb::Context.new(__return_value)
    end

  end
end

