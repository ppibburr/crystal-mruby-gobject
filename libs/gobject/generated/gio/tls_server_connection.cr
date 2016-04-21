module Gio
  module TlsServerConnection
    def self.new_internal(base_io_stream, certificate)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.tls_server_connection_new((base_io_stream.to_unsafe as LibGio::IOStream*), certificate && (certificate.to_unsafe as LibGio::TlsCertificate*), pointerof(__error))
      GLib::Error.assert __error
      __return_value
    end

  end
end

