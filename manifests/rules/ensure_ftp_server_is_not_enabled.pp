# @api private
#  Ensure FTP Server is not enabled (Scored)
#
# Description:
# The File Transfer Protocol (FTP) provides networked computers with the ability to transfer files.
#
# Rationale:
# FTP does not protect the confidentiality of data or authentication credentials.
# It is recommended sftp be used if file transfer is required.
# Unless there is a need to run the system as a FTP server (for example, to allow anonymous downloads),
# it is recommended that the service be disabled to reduce the potential attack surface.
#
# @summary  Ensure FTP Server is not enabled (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_ftp_server_is_not_enabled
class secure_linux_cis::rules::ensure_ftp_server_is_not_enabled(
    Boolean $enforced = true,
) {
  if $enforced {
    service { 'vsftpd':
      ensure   => stopped,
      schedule => 'harden_schedule',
      enable   => false,
    }
  }
}
