module Gio
  module DtlsClientConnection
    def self.new_internal(base_socket, server_identity)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.dtls_client_connection_new((base_socket.to_unsafe as LibGio::DatagramBased*), server_identity && (server_identity.to_unsafe as LibGio::SocketConnectable*), pointerof(__error))
      GLib::Error.assert __error
      __return_value
    end

    def accepted_cas
      __return_value = LibGio.dtls_client_connection_get_accepted_cas((to_unsafe as LibGio::DtlsClientConnection*))
      __return_value
    end

    def server_identity
      __return_value = LibGio.dtls_client_connection_get_server_identity((to_unsafe as LibGio::DtlsClientConnection*))
      __return_value
    end

    def validation_flags
      __return_value = LibGio.dtls_client_connection_get_validation_flags((to_unsafe as LibGio::DtlsClientConnection*))
      __return_value
    end

    def server_identity=(identity)
      __return_value = LibGio.dtls_client_connection_set_server_identity((to_unsafe as LibGio::DtlsClientConnection*), (identity.to_unsafe as LibGio::SocketConnectable*))
      __return_value
    end

    def validation_flags=(flags)
      __return_value = LibGio.dtls_client_connection_set_validation_flags((to_unsafe as LibGio::DtlsClientConnection*), flags)
      __return_value
    end

  end
end

