module Gio
  module DtlsServerConnection
    def self.new_internal(base_socket, certificate)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.dtls_server_connection_new((base_socket.to_unsafe as LibGio::DatagramBased*), certificate && (certificate.to_unsafe as LibGio::TlsCertificate*), pointerof(__error))
      GLib::Error.assert __error
      __return_value
    end

  end
end

