module Gtk
  class TextBuffer < GObject::Object
    def initialize(@gtk_text_buffer)
    end

    def to_unsafe
      @gtk_text_buffer.not_nil!
    end







    def self.new_internal(table)
      __return_value = LibGtk.text_buffer_new(table && (table.to_unsafe as LibGtk::TextTagTable*))
      cast Gtk::TextBuffer.new(__return_value)
    end

    def add_mark(mark, where)
      __return_value = LibGtk.text_buffer_add_mark((to_unsafe as LibGtk::TextBuffer*), (mark.to_unsafe as LibGtk::TextMark*), (where.to_unsafe as LibGtk::TextIter*))
      __return_value
    end

    def add_selection_clipboard(clipboard)
      __return_value = LibGtk.text_buffer_add_selection_clipboard((to_unsafe as LibGtk::TextBuffer*), (clipboard.to_unsafe as LibGtk::Clipboard*))
      __return_value
    end

    def apply_tag(tag, start, end)
      __return_value = LibGtk.text_buffer_apply_tag((to_unsafe as LibGtk::TextBuffer*), (tag.to_unsafe as LibGtk::TextTag*), (start.to_unsafe as LibGtk::TextIter*), (end.to_unsafe as LibGtk::TextIter*))
      __return_value
    end

    def apply_tag_by_name(name, start, end)
      __return_value = LibGtk.text_buffer_apply_tag_by_name((to_unsafe as LibGtk::TextBuffer*), name, (start.to_unsafe as LibGtk::TextIter*), (end.to_unsafe as LibGtk::TextIter*))
      __return_value
    end

    def backspace(iter, interactive, default_editable)
      __return_value = LibGtk.text_buffer_backspace((to_unsafe as LibGtk::TextBuffer*), (iter.to_unsafe as LibGtk::TextIter*), interactive, default_editable)
      __return_value
    end

    def begin_user_action
      __return_value = LibGtk.text_buffer_begin_user_action((to_unsafe as LibGtk::TextBuffer*))
      __return_value
    end

    def copy_clipboard(clipboard)
      __return_value = LibGtk.text_buffer_copy_clipboard((to_unsafe as LibGtk::TextBuffer*), (clipboard.to_unsafe as LibGtk::Clipboard*))
      __return_value
    end

    def create_child_anchor(iter)
      __return_value = LibGtk.text_buffer_create_child_anchor((to_unsafe as LibGtk::TextBuffer*), (iter.to_unsafe as LibGtk::TextIter*))
      Gtk::TextChildAnchor.new(__return_value)
    end

    def create_mark(mark_name, where, left_gravity)
      __return_value = LibGtk.text_buffer_create_mark((to_unsafe as LibGtk::TextBuffer*), mark_name && mark_name, (where.to_unsafe as LibGtk::TextIter*), left_gravity)
      Gtk::TextMark.new(__return_value)
    end

    def cut_clipboard(clipboard, default_editable)
      __return_value = LibGtk.text_buffer_cut_clipboard((to_unsafe as LibGtk::TextBuffer*), (clipboard.to_unsafe as LibGtk::Clipboard*), default_editable)
      __return_value
    end

    def delete(start, end)
      __return_value = LibGtk.text_buffer_delete((to_unsafe as LibGtk::TextBuffer*), (start.to_unsafe as LibGtk::TextIter*), (end.to_unsafe as LibGtk::TextIter*))
      __return_value
    end

    def delete_interactive(start_iter, end_iter, default_editable)
      __return_value = LibGtk.text_buffer_delete_interactive((to_unsafe as LibGtk::TextBuffer*), (start_iter.to_unsafe as LibGtk::TextIter*), (end_iter.to_unsafe as LibGtk::TextIter*), default_editable)
      __return_value
    end

    def delete_mark(mark)
      __return_value = LibGtk.text_buffer_delete_mark((to_unsafe as LibGtk::TextBuffer*), (mark.to_unsafe as LibGtk::TextMark*))
      __return_value
    end

    def delete_mark_by_name(name)
      __return_value = LibGtk.text_buffer_delete_mark_by_name((to_unsafe as LibGtk::TextBuffer*), name)
      __return_value
    end

    def delete_selection(interactive, default_editable)
      __return_value = LibGtk.text_buffer_delete_selection((to_unsafe as LibGtk::TextBuffer*), interactive, default_editable)
      __return_value
    end

    def deserialize(content_buffer, format, iter, data, length)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGtk.text_buffer_deserialize((to_unsafe as LibGtk::TextBuffer*), (content_buffer.to_unsafe as LibGtk::TextBuffer*), (format.to_unsafe as LibGdk::Atom*), (iter.to_unsafe as LibGtk::TextIter*), data, UInt64.new(length), pointerof(__error))
      GLib::Error.assert __error
      __return_value
    end

    def deserialize_get_can_create_tags(format)
      __return_value = LibGtk.text_buffer_deserialize_get_can_create_tags((to_unsafe as LibGtk::TextBuffer*), (format.to_unsafe as LibGdk::Atom*))
      __return_value
    end

    def deserialize_set_can_create_tags(format, can_create_tags)
      __return_value = LibGtk.text_buffer_deserialize_set_can_create_tags((to_unsafe as LibGtk::TextBuffer*), (format.to_unsafe as LibGdk::Atom*), can_create_tags)
      __return_value
    end

    def end_user_action
      __return_value = LibGtk.text_buffer_end_user_action((to_unsafe as LibGtk::TextBuffer*))
      __return_value
    end

    def bounds(start, end)
      __return_value = LibGtk.text_buffer_get_bounds((to_unsafe as LibGtk::TextBuffer*), start, end)
      __return_value
    end

    def char_count
      __return_value = LibGtk.text_buffer_get_char_count((to_unsafe as LibGtk::TextBuffer*))
      __return_value
    end

    def copy_target_list
      __return_value = LibGtk.text_buffer_get_copy_target_list((to_unsafe as LibGtk::TextBuffer*))
      Gtk::TargetList.new(__return_value)
    end

    def deserialize_formats(n_formats)
      __return_value = LibGtk.text_buffer_get_deserialize_formats((to_unsafe as LibGtk::TextBuffer*), Int32.new(n_formats))
      PointerIterator.new(__return_value) {|__item| Gdk::Atom.new(__item) }
    end

    def end_iter(iter)
      __return_value = LibGtk.text_buffer_get_end_iter((to_unsafe as LibGtk::TextBuffer*), iter)
      __return_value
    end

    def has_selection
      __return_value = LibGtk.text_buffer_get_has_selection((to_unsafe as LibGtk::TextBuffer*))
      __return_value
    end

    def insert
      __return_value = LibGtk.text_buffer_get_insert((to_unsafe as LibGtk::TextBuffer*))
      Gtk::TextMark.new(__return_value)
    end

    def iter_at_child_anchor(iter, anchor)
      __return_value = LibGtk.text_buffer_get_iter_at_child_anchor((to_unsafe as LibGtk::TextBuffer*), iter, (anchor.to_unsafe as LibGtk::TextChildAnchor*))
      __return_value
    end

    def iter_at_line(iter, line_number)
      __return_value = LibGtk.text_buffer_get_iter_at_line((to_unsafe as LibGtk::TextBuffer*), iter, Int32.new(line_number))
      __return_value
    end

    def iter_at_line_index(iter, line_number, byte_index)
      __return_value = LibGtk.text_buffer_get_iter_at_line_index((to_unsafe as LibGtk::TextBuffer*), iter, Int32.new(line_number), Int32.new(byte_index))
      __return_value
    end

    def iter_at_line_offset(iter, line_number, char_offset)
      __return_value = LibGtk.text_buffer_get_iter_at_line_offset((to_unsafe as LibGtk::TextBuffer*), iter, Int32.new(line_number), Int32.new(char_offset))
      __return_value
    end

    def iter_at_mark(iter, mark)
      __return_value = LibGtk.text_buffer_get_iter_at_mark((to_unsafe as LibGtk::TextBuffer*), iter, (mark.to_unsafe as LibGtk::TextMark*))
      __return_value
    end

    def iter_at_offset(iter, char_offset)
      __return_value = LibGtk.text_buffer_get_iter_at_offset((to_unsafe as LibGtk::TextBuffer*), iter, Int32.new(char_offset))
      __return_value
    end

    def line_count
      __return_value = LibGtk.text_buffer_get_line_count((to_unsafe as LibGtk::TextBuffer*))
      __return_value
    end

    def mark(name)
      __return_value = LibGtk.text_buffer_get_mark((to_unsafe as LibGtk::TextBuffer*), name)
      Gtk::TextMark.new(__return_value) if __return_value
    end

    def modified
      __return_value = LibGtk.text_buffer_get_modified((to_unsafe as LibGtk::TextBuffer*))
      __return_value
    end

    def paste_target_list
      __return_value = LibGtk.text_buffer_get_paste_target_list((to_unsafe as LibGtk::TextBuffer*))
      Gtk::TargetList.new(__return_value)
    end

    def selection_bound
      __return_value = LibGtk.text_buffer_get_selection_bound((to_unsafe as LibGtk::TextBuffer*))
      Gtk::TextMark.new(__return_value)
    end

    def selection_bounds(start, end)
      __return_value = LibGtk.text_buffer_get_selection_bounds((to_unsafe as LibGtk::TextBuffer*), start, end)
      __return_value
    end

    def serialize_formats(n_formats)
      __return_value = LibGtk.text_buffer_get_serialize_formats((to_unsafe as LibGtk::TextBuffer*), Int32.new(n_formats))
      PointerIterator.new(__return_value) {|__item| Gdk::Atom.new(__item) }
    end

    def slice(start, end, include_hidden_chars)
      __return_value = LibGtk.text_buffer_get_slice((to_unsafe as LibGtk::TextBuffer*), (start.to_unsafe as LibGtk::TextIter*), (end.to_unsafe as LibGtk::TextIter*), include_hidden_chars)
      (raise "Expected string but got null" unless __return_value; ::String.new(__return_value))
    end

    def start_iter(iter)
      __return_value = LibGtk.text_buffer_get_start_iter((to_unsafe as LibGtk::TextBuffer*), iter)
      __return_value
    end

    def tag_table
      __return_value = LibGtk.text_buffer_get_tag_table((to_unsafe as LibGtk::TextBuffer*))
      Gtk::TextTagTable.new(__return_value)
    end

    def text(start, end, include_hidden_chars)
      __return_value = LibGtk.text_buffer_get_text((to_unsafe as LibGtk::TextBuffer*), (start.to_unsafe as LibGtk::TextIter*), (end.to_unsafe as LibGtk::TextIter*), include_hidden_chars)
      (raise "Expected string but got null" unless __return_value; ::String.new(__return_value))
    end

    def insert(iter, text, len)
      __return_value = LibGtk.text_buffer_insert((to_unsafe as LibGtk::TextBuffer*), (iter.to_unsafe as LibGtk::TextIter*), text, Int32.new(len))
      __return_value
    end

    def insert_at_cursor(text, len)
      __return_value = LibGtk.text_buffer_insert_at_cursor((to_unsafe as LibGtk::TextBuffer*), text, Int32.new(len))
      __return_value
    end

    def insert_child_anchor(iter, anchor)
      __return_value = LibGtk.text_buffer_insert_child_anchor((to_unsafe as LibGtk::TextBuffer*), (iter.to_unsafe as LibGtk::TextIter*), (anchor.to_unsafe as LibGtk::TextChildAnchor*))
      __return_value
    end

    def insert_interactive(iter, text, len, default_editable)
      __return_value = LibGtk.text_buffer_insert_interactive((to_unsafe as LibGtk::TextBuffer*), (iter.to_unsafe as LibGtk::TextIter*), text, Int32.new(len), default_editable)
      __return_value
    end

    def insert_interactive_at_cursor(text, len, default_editable)
      __return_value = LibGtk.text_buffer_insert_interactive_at_cursor((to_unsafe as LibGtk::TextBuffer*), text, Int32.new(len), default_editable)
      __return_value
    end

    def insert_markup(iter, markup, len)
      __return_value = LibGtk.text_buffer_insert_markup((to_unsafe as LibGtk::TextBuffer*), (iter.to_unsafe as LibGtk::TextIter*), markup, Int32.new(len))
      __return_value
    end

    def insert_pixbuf(iter, pixbuf)
      __return_value = LibGtk.text_buffer_insert_pixbuf((to_unsafe as LibGtk::TextBuffer*), (iter.to_unsafe as LibGtk::TextIter*), (pixbuf.to_unsafe as LibGdkPixbuf::Pixbuf*))
      __return_value
    end

    def insert_range(iter, start, end)
      __return_value = LibGtk.text_buffer_insert_range((to_unsafe as LibGtk::TextBuffer*), (iter.to_unsafe as LibGtk::TextIter*), (start.to_unsafe as LibGtk::TextIter*), (end.to_unsafe as LibGtk::TextIter*))
      __return_value
    end

    def insert_range_interactive(iter, start, end, default_editable)
      __return_value = LibGtk.text_buffer_insert_range_interactive((to_unsafe as LibGtk::TextBuffer*), (iter.to_unsafe as LibGtk::TextIter*), (start.to_unsafe as LibGtk::TextIter*), (end.to_unsafe as LibGtk::TextIter*), default_editable)
      __return_value
    end

    def move_mark(mark, where)
      __return_value = LibGtk.text_buffer_move_mark((to_unsafe as LibGtk::TextBuffer*), (mark.to_unsafe as LibGtk::TextMark*), (where.to_unsafe as LibGtk::TextIter*))
      __return_value
    end

    def move_mark_by_name(name, where)
      __return_value = LibGtk.text_buffer_move_mark_by_name((to_unsafe as LibGtk::TextBuffer*), name, (where.to_unsafe as LibGtk::TextIter*))
      __return_value
    end

    def paste_clipboard(clipboard, override_location, default_editable)
      __return_value = LibGtk.text_buffer_paste_clipboard((to_unsafe as LibGtk::TextBuffer*), (clipboard.to_unsafe as LibGtk::Clipboard*), override_location && (override_location.to_unsafe as LibGtk::TextIter*), default_editable)
      __return_value
    end

    def place_cursor(where)
      __return_value = LibGtk.text_buffer_place_cursor((to_unsafe as LibGtk::TextBuffer*), (where.to_unsafe as LibGtk::TextIter*))
      __return_value
    end

    def register_deserialize_format(mime_type, function : LibGtk::TextBufferDeserializeFunc, user_data, user_data_destroy : LibGLib::DestroyNotify)
      __return_value = LibGtk.text_buffer_register_deserialize_format((to_unsafe as LibGtk::TextBuffer*), mime_type, function, user_data && user_data, user_data_destroy)
      Gdk::Atom.new(__return_value)
    end

    def register_deserialize_tagset(tagset_name)
      __return_value = LibGtk.text_buffer_register_deserialize_tagset((to_unsafe as LibGtk::TextBuffer*), tagset_name && tagset_name)
      Gdk::Atom.new(__return_value)
    end

    def register_serialize_format(mime_type, function : LibGtk::TextBufferSerializeFunc, user_data, user_data_destroy : LibGLib::DestroyNotify)
      __return_value = LibGtk.text_buffer_register_serialize_format((to_unsafe as LibGtk::TextBuffer*), mime_type, function, user_data && user_data, user_data_destroy)
      Gdk::Atom.new(__return_value)
    end

    def register_serialize_tagset(tagset_name)
      __return_value = LibGtk.text_buffer_register_serialize_tagset((to_unsafe as LibGtk::TextBuffer*), tagset_name && tagset_name)
      Gdk::Atom.new(__return_value)
    end

    def remove_all_tags(start, end)
      __return_value = LibGtk.text_buffer_remove_all_tags((to_unsafe as LibGtk::TextBuffer*), (start.to_unsafe as LibGtk::TextIter*), (end.to_unsafe as LibGtk::TextIter*))
      __return_value
    end

    def remove_selection_clipboard(clipboard)
      __return_value = LibGtk.text_buffer_remove_selection_clipboard((to_unsafe as LibGtk::TextBuffer*), (clipboard.to_unsafe as LibGtk::Clipboard*))
      __return_value
    end

    def remove_tag(tag, start, end)
      __return_value = LibGtk.text_buffer_remove_tag((to_unsafe as LibGtk::TextBuffer*), (tag.to_unsafe as LibGtk::TextTag*), (start.to_unsafe as LibGtk::TextIter*), (end.to_unsafe as LibGtk::TextIter*))
      __return_value
    end

    def remove_tag_by_name(name, start, end)
      __return_value = LibGtk.text_buffer_remove_tag_by_name((to_unsafe as LibGtk::TextBuffer*), name, (start.to_unsafe as LibGtk::TextIter*), (end.to_unsafe as LibGtk::TextIter*))
      __return_value
    end

    def select_range(ins, bound)
      __return_value = LibGtk.text_buffer_select_range((to_unsafe as LibGtk::TextBuffer*), (ins.to_unsafe as LibGtk::TextIter*), (bound.to_unsafe as LibGtk::TextIter*))
      __return_value
    end

    def serialize(content_buffer, format, start, end, length)
      __return_value = LibGtk.text_buffer_serialize((to_unsafe as LibGtk::TextBuffer*), (content_buffer.to_unsafe as LibGtk::TextBuffer*), (format.to_unsafe as LibGdk::Atom*), (start.to_unsafe as LibGtk::TextIter*), (end.to_unsafe as LibGtk::TextIter*), UInt64.new(length))
      PointerIterator.new(__return_value) {|__item| __item }
    end

    def modified=(setting)
      __return_value = LibGtk.text_buffer_set_modified((to_unsafe as LibGtk::TextBuffer*), setting)
      __return_value
    end

    def set_text(text, len)
      __return_value = LibGtk.text_buffer_set_text((to_unsafe as LibGtk::TextBuffer*), text, Int32.new(len))
      __return_value
    end

    def unregister_deserialize_format(format)
      __return_value = LibGtk.text_buffer_unregister_deserialize_format((to_unsafe as LibGtk::TextBuffer*), (format.to_unsafe as LibGdk::Atom*))
      __return_value
    end

    def unregister_serialize_format(format)
      __return_value = LibGtk.text_buffer_unregister_serialize_format((to_unsafe as LibGtk::TextBuffer*), (format.to_unsafe as LibGdk::Atom*))
      __return_value
    end

    alias ApplyTagSignal = TextBuffer, Gtk::TextTag, Gtk::TextIter, Gtk::TextIter -> 
    def on_apply_tag(&__block : ApplyTagSignal)
      __callback = ->(_arg0 : LibGtk::TextBuffer*, _arg1 : LibGtk::LibGtk::TextTag*, _arg2 : LibGtk::LibGtk::TextIter*, _arg3 : LibGtk::LibGtk::TextIter*) {
       __return_value = __block.call(TextBuffer.new(_arg0), Gtk::TextTag.new(_arg1), Gtk::TextIter.new(_arg2), Gtk::TextIter.new(_arg3))
       __return_value
      }
      connect("apply-tag", __callback)
    end

    alias BeginUserActionSignal = TextBuffer -> 
    def on_begin_user_action(&__block : BeginUserActionSignal)
      __callback = ->(_arg0 : LibGtk::TextBuffer*) {
       __return_value = __block.call(TextBuffer.new(_arg0))
       __return_value
      }
      connect("begin-user-action", __callback)
    end

    alias ChangedSignal = TextBuffer -> 
    def on_changed(&__block : ChangedSignal)
      __callback = ->(_arg0 : LibGtk::TextBuffer*) {
       __return_value = __block.call(TextBuffer.new(_arg0))
       __return_value
      }
      connect("changed", __callback)
    end

    alias DeleteRangeSignal = TextBuffer, Gtk::TextIter, Gtk::TextIter -> 
    def on_delete_range(&__block : DeleteRangeSignal)
      __callback = ->(_arg0 : LibGtk::TextBuffer*, _arg1 : LibGtk::LibGtk::TextIter*, _arg2 : LibGtk::LibGtk::TextIter*) {
       __return_value = __block.call(TextBuffer.new(_arg0), Gtk::TextIter.new(_arg1), Gtk::TextIter.new(_arg2))
       __return_value
      }
      connect("delete-range", __callback)
    end

    alias EndUserActionSignal = TextBuffer -> 
    def on_end_user_action(&__block : EndUserActionSignal)
      __callback = ->(_arg0 : LibGtk::TextBuffer*) {
       __return_value = __block.call(TextBuffer.new(_arg0))
       __return_value
      }
      connect("end-user-action", __callback)
    end

    alias InsertChildAnchorSignal = TextBuffer, Gtk::TextIter, Gtk::TextChildAnchor -> 
    def on_insert_child_anchor(&__block : InsertChildAnchorSignal)
      __callback = ->(_arg0 : LibGtk::TextBuffer*, _arg1 : LibGtk::LibGtk::TextIter*, _arg2 : LibGtk::LibGtk::TextChildAnchor*) {
       __return_value = __block.call(TextBuffer.new(_arg0), Gtk::TextIter.new(_arg1), Gtk::TextChildAnchor.new(_arg2))
       __return_value
      }
      connect("insert-child-anchor", __callback)
    end

    alias InsertPixbufSignal = TextBuffer, Gtk::TextIter, GdkPixbuf::Pixbuf -> 
    def on_insert_pixbuf(&__block : InsertPixbufSignal)
      __callback = ->(_arg0 : LibGtk::TextBuffer*, _arg1 : LibGtk::LibGtk::TextIter*, _arg2 : LibGtk::LibGdkPixbuf::Pixbuf*) {
       __return_value = __block.call(TextBuffer.new(_arg0), Gtk::TextIter.new(_arg1), GdkPixbuf::Pixbuf.new(_arg2))
       __return_value
      }
      connect("insert-pixbuf", __callback)
    end

    alias InsertTextSignal = TextBuffer, Gtk::TextIter, UInt8, Int32 -> 
    def on_insert_text(&__block : InsertTextSignal)
      __callback = ->(_arg0 : LibGtk::TextBuffer*, _arg1 : LibGtk::LibGtk::TextIter*, _arg2 : LibGtk::UInt8**, _arg3 : LibGtk::Int32*) {
       __return_value = __block.call(TextBuffer.new(_arg0), Gtk::TextIter.new(_arg1), (raise "Expected string but got null" unless _arg2; ::String.new(_arg2)), _arg3)
       __return_value
      }
      connect("insert-text", __callback)
    end

    alias MarkDeletedSignal = TextBuffer, Gtk::TextMark -> 
    def on_mark_deleted(&__block : MarkDeletedSignal)
      __callback = ->(_arg0 : LibGtk::TextBuffer*, _arg1 : LibGtk::LibGtk::TextMark*) {
       __return_value = __block.call(TextBuffer.new(_arg0), Gtk::TextMark.new(_arg1))
       __return_value
      }
      connect("mark-deleted", __callback)
    end

    alias MarkSetSignal = TextBuffer, Gtk::TextIter, Gtk::TextMark -> 
    def on_mark_set(&__block : MarkSetSignal)
      __callback = ->(_arg0 : LibGtk::TextBuffer*, _arg1 : LibGtk::LibGtk::TextIter*, _arg2 : LibGtk::LibGtk::TextMark*) {
       __return_value = __block.call(TextBuffer.new(_arg0), Gtk::TextIter.new(_arg1), Gtk::TextMark.new(_arg2))
       __return_value
      }
      connect("mark-set", __callback)
    end

    alias ModifiedChangedSignal = TextBuffer -> 
    def on_modified_changed(&__block : ModifiedChangedSignal)
      __callback = ->(_arg0 : LibGtk::TextBuffer*) {
       __return_value = __block.call(TextBuffer.new(_arg0))
       __return_value
      }
      connect("modified-changed", __callback)
    end

    alias PasteDoneSignal = TextBuffer, Gtk::Clipboard -> 
    def on_paste_done(&__block : PasteDoneSignal)
      __callback = ->(_arg0 : LibGtk::TextBuffer*, _arg1 : LibGtk::LibGtk::Clipboard*) {
       __return_value = __block.call(TextBuffer.new(_arg0), Gtk::Clipboard.new(_arg1))
       __return_value
      }
      connect("paste-done", __callback)
    end

    alias RemoveTagSignal = TextBuffer, Gtk::TextTag, Gtk::TextIter, Gtk::TextIter -> 
    def on_remove_tag(&__block : RemoveTagSignal)
      __callback = ->(_arg0 : LibGtk::TextBuffer*, _arg1 : LibGtk::LibGtk::TextTag*, _arg2 : LibGtk::LibGtk::TextIter*, _arg3 : LibGtk::LibGtk::TextIter*) {
       __return_value = __block.call(TextBuffer.new(_arg0), Gtk::TextTag.new(_arg1), Gtk::TextIter.new(_arg2), Gtk::TextIter.new(_arg3))
       __return_value
      }
      connect("remove-tag", __callback)
    end

  end
end

