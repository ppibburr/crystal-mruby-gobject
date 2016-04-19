require "./lib_m_rb"
require "./lib_g_lib"
require "./lib_g_object"

@[Link("mruby-vala")]
@[Link("mruby-shared")]
lib LibMRuby

  ###########################################
  ##    Enums
  ###########################################

  enum TT : UInt32
    ZERO_NONE = 0
    FALSE = 0
    FREE = 0
    TRUE = 1
    FIXNUM = 2
    SYMBOL = 3
    UNDEF = 4
    FLOAT = 5
    CPTR = 6
    OBJECT = 7
    CLASS = 8
    MODULE = 9
    ICLASS = 10
    SCLASS = 11
    PROC = 12
    ARRAY = 13
    HASH = 14
    STRING = 15
    RANGE = 16
    EXCEPTION = 17
    FILE = 18
    ENV = 19
    DATA = 20
    FIBER = 21
    MAXDEFINE = 22
  end


  ###########################################
  ##    Objects
  ###########################################

  struct Value # object
    parent_instance : LibGObject::Object
    priv : LibMRuby::ValuePrivate*
    actual : LibMRb::Value
    mrb : LibMRuby::Context*
  end
  fun value_new = mruby_value_new(act : LibMRb::Value*, mrb : LibMRuby::Context*) : LibMRuby::Value*
  fun value_to_string = mruby_value_to_string(this : Value*, c : LibMRuby::Context*) : UInt8*
  fun value_get_context = mruby_value_get_context(this : Value*, c : LibMRuby::Context*) : LibMRuby::Context*

  struct MRbFuncEnv # object
    parent_instance : LibGObject::Object
    priv : LibMRuby::MRbFuncEnvPrivate*
    fun : LibMRuby::FuncCB
  end
  fun m_rb_func_env_new = mruby_mrb_func_env_new(cb : LibMRuby::FuncCB, cb_target : Void*) : LibMRuby::MRbFuncEnv*

  struct Array # object
    parent_instance : LibMRuby::Object
    priv : LibMRuby::ArrayPrivate*
  end
  fun array_new = mruby_array_new(mrb : LibMRuby::Context*) : LibMRuby::Array*
  fun array_from = mruby_array_new_from(act : LibMRb::Value, c : LibMRuby::Context*) : LibMRuby::Array*
  fun array_context_get = mruby_array_context_get(this : Array*, idx : Int32, c : LibMRuby::Context*) : LibMRuby::Object*
  fun array_context_set = mruby_array_context_set(this : Array*, i : Int32, val : LibMRuby::Value*, ctx : LibMRuby::Context*) : Void
  fun array_set = mruby_array_set(this : Array*, i : Int32, v : LibMRuby::Value*) : Void
  fun array_get = mruby_array_get(this : Array*, i : Int32) : LibMRuby::Object*
  fun array_concat = mruby_array_concat(this : Array*, foo2 : LibMRuby::Object*, ctx : LibMRuby::Context*) : Void
  fun array_splat = mruby_array_splat(this : Array*, ctx : LibMRuby::Context*) : LibMRuby::Object*
  fun array_push = mruby_array_push(this : Array*, foo2 : LibMRuby::Object*, ctx : LibMRuby::Context*) : Void
  fun array_pop = mruby_array_pop(this : Array*, ctx : LibMRuby::Context*) : LibMRuby::Object*
  fun array_replace = mruby_array_replace(this : Array*, b : LibMRuby::Object*, ctx : LibMRuby::Context*) : Void
  fun array_unshift = mruby_array_unshift(this : Array*, item : LibMRuby::Object*, ctx : LibMRuby::Context*) : LibMRuby::Object*
  fun array_shift = mruby_array_shift(this : Array*, ctx : LibMRuby::Context*) : LibMRuby::Object*
  fun array_clear = mruby_array_clear(this : Array*, ctx : LibMRuby::Context*) : LibMRuby::Object*
  fun array_join = mruby_array_join(this : Array*, sep : LibMRuby::Object*, ctx : LibMRuby::Context*) : LibMRuby::Object*
  fun array_resize = mruby_array_resize(this : Array*, len : Int32, ctx : LibMRuby::Context*) : LibMRuby::Object*
  fun array_get_length = mruby_array_get_length(this : Array*) : Int32
  fun array_get_size = mruby_array_get_size(this : Array*) : Int32

  struct String # object
    parent_instance : LibMRuby::Object
    priv : LibMRuby::StringPrivate*
  end
  fun string_from = mruby_string_new_from(act : LibMRb::Value, mrb : LibMRuby::Context*) : LibMRuby::String*
  fun string_new = mruby_string_new(mrb : LibMRuby::Context*, cstr : UInt8*) : LibMRuby::String*

  struct Object # object
    parent_instance : LibMRuby::Value
    priv : LibMRuby::ObjectPrivate*
  end
  fun object_from = mruby_object_new_from(act : LibMRb::Value, mrb : LibMRuby::Context*) : LibMRuby::Object*
  fun object_new = mruby_object_new(mrb : LibMRuby::Context*, cls : Void*, argv : LibMRuby::Value**, argv_length1 : Int32) : LibMRuby::Object*
  fun object_dup = mruby_object_dup(this : Object*, c : LibMRuby::Context*) : LibMRuby::Object*
  fun object_clone = mruby_object_clone(this : Object*, c : LibMRuby::Context*) : LibMRuby::Object*
  fun object_as_string = mruby_object_as_string(this : Object*, ctx : LibMRuby::Context*) : LibMRuby::String*
  fun object_instance_variables = mruby_object_instance_variables(this : Object*, ctx : LibMRuby::Context*) : LibMRuby::Object*
  fun object_respond_to = mruby_object_respond_to(this : Object*, mid : LibMRuby::Symbol, ctx : LibMRuby::Context*) : Bool
  fun object_to_sym = mruby_object_to_sym(this : Object*, ctx : LibMRuby::Context*) : LibMRuby::Symbol
  fun object_eq = mruby_object_eq(this : Object*, foo2 : LibMRuby::Object*, ctx : LibMRuby::Context*) : Bool
  fun object_equal = mruby_object_equal(this : Object*, foo2 : LibMRuby::Object*, ctx : LibMRuby::Context*) : Bool
  fun object_classname = mruby_object_classname(this : Object*, ctx : LibMRuby::Context*) : UInt8*
  fun object_class = mruby_object_class(this : Object*, ctx : LibMRuby::Context*) : Void*
  fun object_is_kind_of = mruby_object_is_kind_of(this : Object*, c : Void*, ctx : LibMRuby::Context*) : Bool
  fun object_inspect = mruby_object_inspect(this : Object*, ctx : LibMRuby::Context*) : LibMRuby::Object*
  fun object_is_instance_of = mruby_object_is_instance_of(this : Object*, c : Void*, ctx : LibMRuby::Context*) : Bool

  struct Module # object
    parent_instance : LibGObject::Object
    priv : LibMRuby::ModulePrivate*
  end
  fun module_get_value = mruby_module_get_value(this : Module*) : LibMRuby::Value*
  fun module_new = mruby_module_new(pointer : Void*) : LibMRuby::Module*
  fun module_from_value = mruby_module_new_from_value(value : LibMRuby::Value*) : LibMRuby::Module*
  fun module_define = mruby_module_new_define(mrb : LibMRuby::Context*, name : UInt8*, under : LibMRuby::Module*) : LibMRuby::Module*
  fun module_create = mruby_module_new_create(mrb : LibMRuby::Context*) : LibMRuby::Module*
  fun module_get = mruby_module_new_get(mrb : LibMRuby::Context*, name : UInt8*) : LibMRuby::Module*
  fun module_define_method = mruby_module_define_method(this : Module*, mrb : LibMRuby::Context*, name : UInt8*, cb : LibMRuby::FuncCB, cb_target : Void*) : Void
  fun module_define_static_method = mruby_module_define_static_method(this : Module*, mrb : LibMRuby::Context*, name : UInt8*, cb : LibMRuby::FuncCB, cb_target : Void*) : Void
  fun module_invoke_func_with_env = mruby_module_invoke_func_with_env(mrb : LibMRuby::Context*, _self : LibMRuby::Value*) : LibMRuby::Value*
  fun module_get_pointer = mruby_module_get_pointer(this : Module*) : Void*
  fun module_set_pointer = mruby_module_set_pointer(this : Module*, value : Void*) : Void

  struct Class # object
    parent_instance : LibMRuby::Module
    priv : LibMRuby::ClassPrivate*
  end
  fun class_new = mruby_class_new(pointer : Void*) : LibMRuby::Class*
  fun class_define = mruby_class_new_define(mrb : LibMRuby::Context*, name : UInt8*, super : LibMRuby::Class*, under : LibMRuby::Module*) : LibMRuby::Class*
  fun class_create = mruby_class_new_create(mrb : LibMRuby::Context*, super : LibMRuby::Class*) : LibMRuby::Class*
  fun class_get = mruby_class_new_get(mrb : LibMRuby::Context*, name : UInt8*) : LibMRuby::Class*


  ###########################################
  ##    Structs
  ###########################################

  struct ValuePrivate # struct
    _data : UInt8[0]
  end

  struct MRbFuncEnvPrivate # struct
    _data : UInt8[0]
  end

  struct ArrayPrivate # struct
    _data : UInt8[0]
  end

  struct StringPrivate # struct
    _data : UInt8[0]
  end

  struct ObjectPrivate # struct
    _data : UInt8[0]
  end

  struct ModulePrivate # struct
    _data : UInt8[0]
  end

  struct ClassPrivate # struct
    _data : UInt8[0]
  end

  struct Context # struct
    _data : UInt8[0]
  end
  fun context_define_method = mruby_context_define_method(this : Context*, name : UInt8*, cb : LibMRuby::FuncCB, cb_target : Void*) : Void
  fun context_class_get = mruby_context_class_get(this : Context*, name : UInt8*) : LibMRuby::Class*
  fun context_module_get = mruby_context_module_get(this : Context*, name : UInt8*) : LibMRuby::Module*
  fun context_float_value = mruby_context_float_value(this : Context*, val : Float32) : LibMRuby::Object*
  fun context_cptr_value = mruby_context_cptr_value(this : Context*, val : Void*) : LibMRuby::Object*
  fun context_ary_len = mruby_context_ary_len(this : Context*, val : LibMRuby::Value*) : Int32
  fun context_obj_new = mruby_context_obj_new(this : Context*, cls : Void*, argv : LibMRuby::Value**, argv_length1 : Int32) : LibMRuby::Object*
  fun context_load_string = mruby_context_load_string(this : Context*, str : UInt8*) : LibMRuby::Object*
  fun context_sys_fail = mruby_context_sys_fail(this : Context*, mesg : UInt8*) : Void
  fun context_exc_new_str = mruby_context_exc_new_str(this : Context*, c : Void*, str : LibMRuby::Value*) : LibMRuby::Object*
  fun context_exc_backtrace = mruby_context_exc_backtrace(this : Context*, exc : LibMRuby::Value*) : LibMRuby::Object*
  fun context_get_backtrace = mruby_context_get_backtrace(this : Context*) : LibMRuby::Object*
  fun context_f_raise = mruby_context_f_raise(this : Context*, foo1 : LibMRuby::Value*) : LibMRuby::Object*
  fun context_str_concat = mruby_context_str_concat(this : Context*, foo1 : LibMRuby::Value*, foo2 : LibMRuby::Value*) : Void
  fun context_str_plus = mruby_context_str_plus(this : Context*, foo1 : LibMRuby::Value*, foo2 : LibMRuby::Value*) : LibMRuby::Object*
  fun context_ptr_to_str = mruby_context_ptr_to_str(this : Context*, foo1 : Void*) : LibMRuby::Object*
  fun context_obj_as_string = mruby_context_obj_as_string(this : Context*, obj : LibMRuby::Value*) : LibMRuby::String*
  fun context_str_resize = mruby_context_str_resize(this : Context*, str : LibMRuby::Value*, len : Int32) : LibMRuby::Object*
  fun context_str_substr = mruby_context_str_substr(this : Context*, str : LibMRuby::Value*, beg : Int32, len : Int32) : LibMRuby::Object*
  fun context_string_type = mruby_context_string_type(this : Context*, str : LibMRuby::Value*) : LibMRuby::Object*
  fun context_check_string_type = mruby_context_check_string_type(this : Context*, str : LibMRuby::Value*) : LibMRuby::Object*
  fun context_str_buf_new = mruby_context_str_buf_new(this : Context*, capa : UInt64) : LibMRuby::Object*
  fun context_string_value_ptr = mruby_context_string_value_ptr(this : Context*, ptr : LibMRuby::Value*) : UInt8*
  fun context_str_dup = mruby_context_str_dup(this : Context*, str : LibMRuby::Value*) : LibMRuby::Object*
  fun context_str_intern = mruby_context_str_intern(this : Context*, _self : LibMRuby::Value*) : LibMRuby::Object*
  fun context_str_to_inum = mruby_context_str_to_inum(this : Context*, str : LibMRuby::Value*, _base : Int32, badcheck : Bool) : LibMRuby::Object*
  fun context_str_to_str = mruby_context_str_to_str(this : Context*, str : LibMRuby::Value*) : LibMRuby::Object*
  fun context_str_equal = mruby_context_str_equal(this : Context*, str1 : LibMRuby::Value*, str2 : LibMRuby::Value*) : Bool
  fun context_str_cat = mruby_context_str_cat(this : Context*, str : LibMRuby::Value*, ptr : UInt8*, len : UInt64) : LibMRuby::Object*
  fun context_str_cat_cstr = mruby_context_str_cat_cstr(this : Context*, str : LibMRuby::Value*, ptr : UInt8*) : LibMRuby::Object*
  fun context_str_cat_str = mruby_context_str_cat_str(this : Context*, str : LibMRuby::Value*, str2 : LibMRuby::Value*) : LibMRuby::Object*
  fun context_str_append = mruby_context_str_append(this : Context*, str : LibMRuby::Value*, str2 : LibMRuby::Value*) : LibMRuby::Object*
  fun context_str_to_cstr = mruby_context_str_to_cstr(this : Context*, str : LibMRuby::Value*) : Void*
  fun context_str_pool = mruby_context_str_pool(this : Context*, str : LibMRuby::Value*) : LibMRuby::Object*
  fun context_str_hash = mruby_context_str_hash(this : Context*, str : LibMRuby::Value*) : Int32
  fun context_str_dump = mruby_context_str_dump(this : Context*, str : LibMRuby::Value*) : LibMRuby::Object*
  fun context_str_inspect = mruby_context_str_inspect(this : Context*, str : LibMRuby::Value*) : LibMRuby::Object*
  fun context_noregexp = mruby_context_noregexp(this : Context*, _self : LibMRuby::Value*) : Void
  fun context_regexp_check = mruby_context_regexp_check(this : Context*, obj : LibMRuby::Value*) : Void
  fun context_range_new = mruby_context_range_new(this : Context*, foo1 : LibMRuby::Value*, foo2 : LibMRuby::Value*, foo3 : Bool) : LibMRuby::Object*
  fun context_define_class_id = mruby_context_define_class_id(this : Context*, foo1 : LibMRuby::Symbol, foo2 : Void*) : Void*
  fun context_define_module_id = mruby_context_define_module_id(this : Context*, foo1 : LibMRuby::Symbol) : Void*
  fun context_vm_define_class = mruby_context_vm_define_class(this : Context*, foo1 : LibMRuby::Value*, foo2 : LibMRuby::Value*, foo3 : LibMRuby::Symbol) : Void*
  fun context_vm_define_module = mruby_context_vm_define_module(this : Context*, foo1 : LibMRuby::Value*, foo2 : LibMRuby::Symbol) : Void*
  fun context_define_method_raw = mruby_context_define_method_raw(this : Context*, foo1 : Void*, foo2 : LibMRuby::Symbol, foo3 : Void*) : Void
  fun context_define_method_id = mruby_context_define_method_id(this : Context*, c : Void*, mid : LibMRuby::Symbol, func : Void*, aspec : UInt32) : Void
  fun context_alias_method = mruby_context_alias_method(this : Context*, c : Void*, a : LibMRuby::Symbol, b : LibMRuby::Symbol) : Void
  fun context_class_outer_module = mruby_context_class_outer_module(this : Context*, foo1 : Void*) : Void*
  fun context_method_search = mruby_context_method_search(this : Context*, foo1 : Void*, foo2 : LibMRuby::Symbol) : Void*
  fun context_gc_mark_mt = mruby_context_gc_mark_mt(this : Context*, foo1 : Void*) : Void
  fun context_gc_mark_mt_size = mruby_context_gc_mark_mt_size(this : Context*, foo1 : Void*) : UInt64
  fun context_gc_free_mt = mruby_context_gc_free_mt(this : Context*, foo1 : Void*) : Void
  fun context_flo_to_fixnum = mruby_context_flo_to_fixnum(this : Context*, val : LibMRuby::Value*) : LibMRuby::Object*
  fun context_float_to_str = mruby_context_float_to_str(this : Context*, x : LibMRuby::Value*, fmt : UInt8*) : LibMRuby::Object*
  fun context_to_flo = mruby_context_to_flo(this : Context*, x : LibMRuby::Value*) : Float32
  fun context_fixnum_plus = mruby_context_fixnum_plus(this : Context*, x : LibMRuby::Value*, y : LibMRuby::Value*) : LibMRuby::Object*
  fun context_fixnum_minus = mruby_context_fixnum_minus(this : Context*, x : LibMRuby::Value*, y : LibMRuby::Value*) : LibMRuby::Object*
  fun context_fixnum_mul = mruby_context_fixnum_mul(this : Context*, x : LibMRuby::Value*, y : LibMRuby::Value*) : LibMRuby::Object*
  fun context_num_div = mruby_context_num_div(this : Context*, x : LibMRuby::Value*, y : LibMRuby::Value*) : LibMRuby::Object*
  fun context_proc_new_cfunc = mruby_context_proc_new_cfunc(this : Context*, foo1 : Void*) : Void*
  fun context_f_send = mruby_context_f_send(this : Context*, _self : LibMRuby::Value*) : LibMRuby::Object*
  fun context_proc_cfunc_env_get = mruby_context_proc_cfunc_env_get(this : Context*, foo1 : Int32) : LibMRuby::Object*
  fun context_ary_new_capa = mruby_context_ary_new_capa(this : Context*, foo1 : Int32) : LibMRuby::Object*
  fun context_ary_new = mruby_context_ary_new(this : Context*) : LibMRuby::Array*
  fun context_ary_new_from_values = mruby_context_ary_new_from_values(this : Context*, size : Int32, vals : LibMRuby::Value**, vals_length1 : Int32) : LibMRuby::Array*
  fun context_assoc_new = mruby_context_assoc_new(this : Context*, car : LibMRuby::Value*, cdr : LibMRuby::Value*) : LibMRuby::Object*
  fun context_ary_concat = mruby_context_ary_concat(this : Context*, foo1 : LibMRuby::Value*, foo2 : LibMRuby::Value*) : Void
  fun context_ary_splat = mruby_context_ary_splat(this : Context*, foo1 : LibMRuby::Value*) : LibMRuby::Object*
  fun context_ary_push = mruby_context_ary_push(this : Context*, foo1 : LibMRuby::Value*, foo2 : LibMRuby::Value*) : Void
  fun context_ary_pop = mruby_context_ary_pop(this : Context*, ary : LibMRuby::Value*) : LibMRuby::Object*
  fun context_ary_ref = mruby_context_ary_ref(this : Context*, ary : LibMRuby::Value*, n : Int32) : LibMRuby::Object*
  fun context_ary_set = mruby_context_ary_set(this : Context*, ary : LibMRuby::Value*, n : Int32, val : LibMRuby::Value*) : Void
  fun context_ary_replace = mruby_context_ary_replace(this : Context*, a : LibMRuby::Value*, b : LibMRuby::Value*) : Void
  fun context_check_array_type = mruby_context_check_array_type(this : Context*, _self : LibMRuby::Value*) : LibMRuby::Object*
  fun context_ary_unshift = mruby_context_ary_unshift(this : Context*, _self : LibMRuby::Value*, item : LibMRuby::Value*) : LibMRuby::Object*
  fun context_ary_shift = mruby_context_ary_shift(this : Context*, _self : LibMRuby::Value*) : LibMRuby::Object*
  fun context_ary_clear = mruby_context_ary_clear(this : Context*, _self : LibMRuby::Value*) : LibMRuby::Object*
  fun context_ary_join = mruby_context_ary_join(this : Context*, ary : LibMRuby::Value*, sep : LibMRuby::Value*) : LibMRuby::Object*
  fun context_ary_resize = mruby_context_ary_resize(this : Context*, ary : LibMRuby::Value*, len : Int32) : LibMRuby::Object*
  fun context_hash_new = mruby_context_hash_new(this : Context*) : LibMRuby::Object*
  fun context_hash_set = mruby_context_hash_set(this : Context*, hash : LibMRuby::Value*, key : LibMRuby::Value*, val : LibMRuby::Value*) : Void
  fun context_hash_get = mruby_context_hash_get(this : Context*, hash : LibMRuby::Value*, key : LibMRuby::Value*) : LibMRuby::Object*
  fun context_hash_fetch = mruby_context_hash_fetch(this : Context*, hash : LibMRuby::Value*, key : LibMRuby::Value*, _def : LibMRuby::Value*) : LibMRuby::Object*
  fun context_hash_delete_key = mruby_context_hash_delete_key(this : Context*, hash : LibMRuby::Value*, key : LibMRuby::Value*) : LibMRuby::Object*
  fun context_hash_keys = mruby_context_hash_keys(this : Context*, hash : LibMRuby::Value*) : LibMRuby::Object*
  fun context_check_hash_type = mruby_context_check_hash_type(this : Context*, hash : LibMRuby::Value*) : LibMRuby::Object*
  fun context_hash_empty_p = mruby_context_hash_empty_p(this : Context*, _self : LibMRuby::Value*) : LibMRuby::Object*
  fun context_hash_clear = mruby_context_hash_clear(this : Context*, hash : LibMRuby::Value*) : LibMRuby::Object*
  fun context_vm_special_get = mruby_context_vm_special_get(this : Context*, foo1 : LibMRuby::Symbol) : LibMRuby::Object*
  fun context_vm_special_set = mruby_context_vm_special_set(this : Context*, foo1 : LibMRuby::Symbol, foo2 : LibMRuby::Value*) : Void
  fun context_vm_iv_get = mruby_context_vm_iv_get(this : Context*, foo1 : LibMRuby::Symbol) : LibMRuby::Object*
  fun context_vm_iv_set = mruby_context_vm_iv_set(this : Context*, foo1 : LibMRuby::Symbol, foo2 : LibMRuby::Value*) : Void
  fun context_vm_cv_get = mruby_context_vm_cv_get(this : Context*, foo1 : LibMRuby::Symbol) : LibMRuby::Object*
  fun context_vm_cv_set = mruby_context_vm_cv_set(this : Context*, foo1 : LibMRuby::Symbol, foo2 : LibMRuby::Value*) : Void
  fun context_vm_const_get = mruby_context_vm_const_get(this : Context*, foo1 : LibMRuby::Symbol) : LibMRuby::Object*
  fun context_vm_const_set = mruby_context_vm_const_set(this : Context*, foo1 : LibMRuby::Symbol, foo2 : LibMRuby::Value*) : Void
  fun context_const_get = mruby_context_const_get(this : Context*, foo1 : LibMRuby::Value*, foo2 : LibMRuby::Symbol) : LibMRuby::Object*
  fun context_const_set = mruby_context_const_set(this : Context*, foo1 : LibMRuby::Value*, foo2 : LibMRuby::Symbol, foo3 : LibMRuby::Value*) : Void
  fun context_const_defined = mruby_context_const_defined(this : Context*, foo1 : LibMRuby::Value*, foo2 : LibMRuby::Symbol) : Bool
  fun context_const_remove = mruby_context_const_remove(this : Context*, foo1 : LibMRuby::Value*, foo2 : LibMRuby::Symbol) : Void
  fun context_iv_p = mruby_context_iv_p(this : Context*, sym : LibMRuby::Symbol) : Bool
  fun context_iv_check = mruby_context_iv_check(this : Context*, sym : LibMRuby::Symbol) : Void
  fun context_iv_get = mruby_context_iv_get(this : Context*, obj : LibMRuby::Value*, sym : LibMRuby::Symbol) : LibMRuby::Object*
  fun context_iv_set = mruby_context_iv_set(this : Context*, obj : LibMRuby::Value*, sym : LibMRuby::Symbol, v : LibMRuby::Value*) : Void
  fun context_iv_defined = mruby_context_iv_defined(this : Context*, foo1 : LibMRuby::Value*, foo2 : LibMRuby::Symbol) : Bool
  fun context_iv_remove = mruby_context_iv_remove(this : Context*, obj : LibMRuby::Value*, sym : LibMRuby::Symbol) : LibMRuby::Object*
  fun context_iv_copy = mruby_context_iv_copy(this : Context*, dst : LibMRuby::Value*, src : LibMRuby::Value*) : Void
  fun context_const_defined_at = mruby_context_const_defined_at(this : Context*, mod : LibMRuby::Value*, id : LibMRuby::Symbol) : Bool
  fun context_gv_get = mruby_context_gv_get(this : Context*, sym : LibMRuby::Symbol) : LibMRuby::Object*
  fun context_gv_set = mruby_context_gv_set(this : Context*, sym : LibMRuby::Symbol, val : LibMRuby::Value*) : Void
  fun context_gv_remove = mruby_context_gv_remove(this : Context*, sym : LibMRuby::Symbol) : Void
  fun context_cv_get = mruby_context_cv_get(this : Context*, mod : LibMRuby::Value*, sym : LibMRuby::Symbol) : LibMRuby::Object*
  fun context_cv_set = mruby_context_cv_set(this : Context*, mod : LibMRuby::Value*, sym : LibMRuby::Symbol, v : LibMRuby::Value*) : Void
  fun context_cv_defined = mruby_context_cv_defined(this : Context*, mod : LibMRuby::Value*, sym : LibMRuby::Symbol) : Bool
  fun context_mod_constants = mruby_context_mod_constants(this : Context*, mod : LibMRuby::Value*) : LibMRuby::Object*
  fun context_f_global_variables = mruby_context_f_global_variables(this : Context*, _self : LibMRuby::Value*) : LibMRuby::Object*
  fun context_obj_instance_variables = mruby_context_obj_instance_variables(this : Context*, foo1 : LibMRuby::Value*) : LibMRuby::Object*
  fun context_mod_class_variables = mruby_context_mod_class_variables(this : Context*, foo1 : LibMRuby::Value*) : LibMRuby::Object*
  fun context_class_sym = mruby_context_class_sym(this : Context*, c : Void*, outer : Void*) : LibMRuby::Symbol
  fun context_gc_mark_gv = mruby_context_gc_mark_gv(this : Context*) : Void
  fun context_gc_free_gv = mruby_context_gc_free_gv(this : Context*) : Void
  fun context_define_class = mruby_context_define_class(this : Context*, foo1 : UInt8*, foo2 : Void*) : Void*
  fun context_define_module = mruby_context_define_module(this : Context*, foo1 : UInt8*) : Void*
  fun context_singleton_class = mruby_context_singleton_class(this : Context*, foo1 : LibMRuby::Value*) : LibMRuby::Object*
  fun context_include_module = mruby_context_include_module(this : Context*, foo1 : Void*, foo2 : Void*) : Void
  fun context_define_class_method = mruby_context_define_class_method(this : Context*, foo1 : Void*, foo2 : UInt8*, foo3 : Void*, foo4 : UInt32) : Void
  fun context_define_module_function = mruby_context_define_module_function(this : Context*, foo1 : Void*, foo2 : UInt8*, foo3 : Void*, foo4 : UInt32) : Void
  fun context_define_const = mruby_context_define_const(this : Context*, foo1 : Void*, name : UInt8*, foo2 : LibMRuby::Value*) : Void
  fun context_undef_method = mruby_context_undef_method(this : Context*, foo1 : Void*, foo2 : UInt8*) : Void
  fun context_undef_class_method = mruby_context_undef_class_method(this : Context*, foo1 : Void*, foo2 : UInt8*) : Void
  fun context_instance_new = mruby_context_instance_new(this : Context*, cv : LibMRuby::Value*) : LibMRuby::Object*
  fun context_class_new = mruby_context_class_new(this : Context*, super : Void*) : Void*
  fun context_module_new = mruby_context_module_new(this : Context*) : Void*
  fun context_class_defined = mruby_context_class_defined(this : Context*, name : UInt8*) : Bool
  fun context_class_get_under = mruby_context_class_get_under(this : Context*, outer : Void*, name : UInt8*) : Void*
  fun context_module_get_under = mruby_context_module_get_under(this : Context*, outer : Void*, name : UInt8*) : Void*
  fun context_notimplement_m = mruby_context_notimplement_m(this : Context*, foo1 : LibMRuby::Value*) : LibMRuby::Object*
  fun context_obj_dup = mruby_context_obj_dup(this : Context*, obj : LibMRuby::Value*) : LibMRuby::Object*
  fun context_check_to_integer = mruby_context_check_to_integer(this : Context*, val : LibMRuby::Value*, method : UInt8*) : LibMRuby::Object*
  fun context_obj_respond_to = mruby_context_obj_respond_to(this : Context*, c : Void*, mid : LibMRuby::Symbol) : Bool
  fun context_define_class_under = mruby_context_define_class_under(this : Context*, outer : Void*, name : UInt8*, super : Void*) : Void*
  fun context_define_module_under = mruby_context_define_module_under(this : Context*, outer : Void*, name : UInt8*) : Void*
  fun context_funcall_argv = mruby_context_funcall_argv(this : Context*, foo1 : LibMRuby::Value*, foo2 : LibMRuby::Symbol, foo3 : Int32, foo4 : LibMRuby::Value**, foo4_length1 : Int32) : LibMRuby::Object*
  fun context_funcall_with_block = mruby_context_funcall_with_block(this : Context*, foo1 : LibMRuby::Value*, foo2 : LibMRuby::Symbol, foo3 : Int32, foo4 : LibMRuby::Value**, foo4_length1 : Int32, foo5 : LibMRuby::Value*) : LibMRuby::Object*
  fun context_intern_cstr = mruby_context_intern_cstr(this : Context*, foo1 : UInt8*) : LibMRuby::Symbol
  fun context_intern = mruby_context_intern(this : Context*, foo1 : UInt8*, foo2 : UInt64) : LibMRuby::Symbol
  fun context_intern_static = mruby_context_intern_static(this : Context*, foo1 : UInt8*, foo2 : UInt64) : LibMRuby::Symbol
  fun context_intern_str = mruby_context_intern_str(this : Context*, foo1 : LibMRuby::Value*) : LibMRuby::Symbol
  fun context_check_intern_cstr = mruby_context_check_intern_cstr(this : Context*, foo1 : UInt8*) : LibMRuby::Object*
  fun context_check_intern = mruby_context_check_intern(this : Context*, foo1 : UInt8*, foo2 : UInt64) : LibMRuby::Object*
  fun context_check_intern_str = mruby_context_check_intern_str(this : Context*, foo1 : LibMRuby::Value*) : LibMRuby::Object*
  fun context_sym2name = mruby_context_sym2name(this : Context*, foo1 : LibMRuby::Symbol) : UInt8*
  fun context_sym2str = mruby_context_sym2str(this : Context*, foo1 : LibMRuby::Symbol) : LibMRuby::Object*
  fun context_malloc = mruby_context_malloc(this : Context*, foo1 : UInt64) : Void*
  fun context_calloc = mruby_context_calloc(this : Context*, foo1 : UInt64, foo2 : UInt64) : Void*
  fun context_realloc = mruby_context_realloc(this : Context*, foo1 : Void*, foo2 : UInt64) : Void*
  fun context_realloc_simple = mruby_context_realloc_simple(this : Context*, foo1 : Void*, foo2 : UInt64) : Void*
  fun context_malloc_simple = mruby_context_malloc_simple(this : Context*, foo1 : UInt64) : Void*
  fun context_free = mruby_context_free(this : Context*, foo1 : Void*) : Void
  fun context_str_new = mruby_context_str_new(this : Context*, p : UInt8*, len : UInt64) : LibMRuby::Object*
  fun context_str_new_cstr = mruby_context_str_new_cstr(this : Context*, foo1 : UInt8*) : LibMRuby::String*
  fun context_str_new_static = mruby_context_str_new_static(this : Context*, p : UInt8*, len : UInt64) : LibMRuby::Object*
  fun context_close = mruby_context_close(this : Context*) : Void
  fun context_default_allocf = mruby_context_default_allocf(this : Context*, foo1 : Void*, foo2 : UInt64, foo3 : Void*) : Void*
  fun context_top_self = mruby_context_top_self(this : Context*) : LibMRuby::Object*
  fun context_run = mruby_context_run(this : Context*, foo1 : Void*, foo2 : LibMRuby::Value*) : LibMRuby::Object*
  fun context_toplevel_run = mruby_context_toplevel_run(this : Context*, foo1 : Void*) : LibMRuby::Object*
  fun context_p = mruby_context_p(this : Context*, foo1 : LibMRuby::Value*) : Void
  fun context_obj_to_sym = mruby_context_obj_to_sym(this : Context*, name : LibMRuby::Value*) : LibMRuby::Symbol
  fun context_obj_eq = mruby_context_obj_eq(this : Context*, foo1 : LibMRuby::Value*, foo2 : LibMRuby::Value*) : Bool
  fun context_obj_equal = mruby_context_obj_equal(this : Context*, foo1 : LibMRuby::Value*, foo2 : LibMRuby::Value*) : Bool
  fun context_equal = mruby_context_equal(this : Context*, obj1 : LibMRuby::Value*, obj2 : LibMRuby::Value*) : Bool
  fun context_Integer = mruby_context_Integer(this : Context*, val : LibMRuby::Value*) : LibMRuby::Object*
  fun context_Float = mruby_context_Float(this : Context*, val : LibMRuby::Value*) : LibMRuby::Object*
  fun context_inspect = mruby_context_inspect(this : Context*, obj : LibMRuby::Value*) : LibMRuby::Object*
  fun context_eql = mruby_context_eql(this : Context*, obj1 : LibMRuby::Value*, obj2 : LibMRuby::Value*) : Bool
  fun context_garbage_collect = mruby_context_garbage_collect(this : Context*) : Void
  fun context_full_gc = mruby_context_full_gc(this : Context*) : Void
  fun context_incremental_gc = mruby_context_incremental_gc(this : Context*) : Void
  fun context_any_to_s = mruby_context_any_to_s(this : Context*, obj : LibMRuby::Value*) : LibMRuby::Object*
  fun context_obj_classname = mruby_context_obj_classname(this : Context*, obj : LibMRuby::Value*) : UInt8*
  fun context_obj_class = mruby_context_obj_class(this : Context*, obj : LibMRuby::Value*) : Void*
  fun context_class_path = mruby_context_class_path(this : Context*, c : Void*) : LibMRuby::Object*
  fun context_obj_is_kind_of = mruby_context_obj_is_kind_of(this : Context*, obj : LibMRuby::Value*, c : Void*) : Bool
  fun context_obj_inspect = mruby_context_obj_inspect(this : Context*, _self : LibMRuby::Value*) : LibMRuby::Object*
  fun context_obj_clone = mruby_context_obj_clone(this : Context*, _self : LibMRuby::Value*) : LibMRuby::Object*
  fun context_exc_new = mruby_context_exc_new(this : Context*, c : Void*, ptr : UInt8*, len : UInt64) : LibMRuby::Object*
  fun context_print_backtrace = mruby_context_print_backtrace(this : Context*) : Void
  fun context_print_error = mruby_context_print_error(this : Context*) : Void
  fun context_yield = mruby_context_yield(this : Context*, b : LibMRuby::Value*, arg : LibMRuby::Value*) : LibMRuby::Object*
  fun context_yield_argv = mruby_context_yield_argv(this : Context*, b : LibMRuby::Value*, argc : Int32, argv : LibMRuby::Value**, argv_length1 : Int32) : LibMRuby::Object*
  fun context_yield_with_class = mruby_context_yield_with_class(this : Context*, b : LibMRuby::Value*, argc : Int32, argv : LibMRuby::Value**, argv_length1 : Int32, _self : LibMRuby::Value*, c : Void*) : LibMRuby::Object*
  fun context_gc_protect = mruby_context_gc_protect(this : Context*, obj : LibMRuby::Value*) : Void
  fun context_to_int = mruby_context_to_int(this : Context*, val : LibMRuby::Value*) : LibMRuby::Object*
  fun context_define_alias = mruby_context_define_alias(this : Context*, klass : Void*, name1 : UInt8*, name2 : UInt8*) : Void
  fun context_class_name = mruby_context_class_name(this : Context*, klass : Void*) : UInt8*
  fun context_define_global_const = mruby_context_define_global_const(this : Context*, name : UInt8*, val : LibMRuby::Value*) : Void
  fun context_attr_get = mruby_context_attr_get(this : Context*, obj : LibMRuby::Value*, id : LibMRuby::Symbol) : LibMRuby::Object*
  fun context_respond_to = mruby_context_respond_to(this : Context*, obj : LibMRuby::Value*, mid : LibMRuby::Symbol) : Bool
  fun context_obj_is_instance_of = mruby_context_obj_is_instance_of(this : Context*, obj : LibMRuby::Value*, c : Void*) : Bool
  fun context_fiber_resume = mruby_context_fiber_resume(this : Context*, fib : LibMRuby::Value*, argc : Int32, argv : LibMRuby::Value**, argv_length1 : Int32) : LibMRuby::Object*
  fun context_fiber_yield = mruby_context_fiber_yield(this : Context*, argc : Int32, argv : LibMRuby::Value**, argv_length1 : Int32) : LibMRuby::Object*
  fun context_alloca = mruby_context_alloca(this : Context*, foo1 : UInt64) : Void*
  fun context_show_version = mruby_context_show_version(this : Context*) : Void
  fun context_show_copyright = mruby_context_show_copyright(this : Context*) : Void
  fun context_new = mruby_context_new() : LibMRuby::Context*
  fun context_get__base_ = mruby_context_get__base_(this : Context*) : LibMRb::Context*

  struct Symbol # struct
    _data : UInt8[0]
  end


  ###########################################
  ##    Functions
  ###########################################

  fun cptr = mruby_cptr(val : LibMRuby::Value*) : Void*
  fun nil_value = mruby_nil_value() : LibMRuby::Value*
  fun true_value = mruby_true_value() : LibMRuby::Value*
  fun false_value = mruby_false_value() : LibMRuby::Value*
  fun bool_value = mruby_bool_value(val : Bool) : LibMRuby::Value*
  fun fixnum_value = mruby_fixnum_value(val : Int32) : LibMRuby::Value*
  fun obj_ptr = mruby_obj_ptr(obj : LibMRuby::Value*) : Void*
  fun class_ptr = mruby_class_ptr(kls : LibMRuby::Value*) : Void*
  fun fixnum = mruby_fixnum(v : LibMRuby::Value*) : Int32
  fun test = mruby_test(v : LibMRuby::Value*) : Bool
  fun type = mruby_type(v : LibMRuby::Value*) : LibMRuby::TT
  fun nil_p = mruby_nil_p(v : LibMRuby::Value*) : Void*
  fun mrb2vary = mruby_mrb2vary(m : LibMRb::Value*, m_length1 : Int32, a : Int32*, result_length1 : Int32*) : LibMRuby::Value**
  fun vary2mrb = mruby_vary2mrb(a : LibMRuby::Value**, a_length1 : Int32, result_length1 : Int32*) : LibMRb::Value*
  fun mrb2gval = mruby_mrb2gval(mrb : LibMRuby::Context*, m : LibMRuby::Value*) : LibGObject::Value*
  fun gval2mrb = mruby_gval2mrb(mrb : LibMRuby::Context*, val : LibGObject::Value*) : LibMRuby::Value*
  fun obj_value = mruby_obj_value(obj : Void*) : LibMRuby::Object*

  ###########################################
  ##    Callbacks
  ###########################################

 alias FuncCB = LibMRuby::Context*, LibMRuby::Value*, LibGObject::Value*, Void* -> LibGObject::Value*
end

