module Gio
  module TlsFileDatabase
    def self.new_internal(anchors)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.tls_file_database_new(anchors, pointerof(__error))
      GLib::Error.assert __error
      __return_value
    end

  end
end

