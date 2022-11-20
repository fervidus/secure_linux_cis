# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
class secure_linux_cis::rules::ensure_ftp_server_is_not_enabled {
  service { 'ftp':
    ensure => stopped,
    enable => false,
  }
}
