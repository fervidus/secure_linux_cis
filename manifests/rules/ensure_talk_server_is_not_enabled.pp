# @api private
#
# @summary Ensure talk server is not enabled 
#
class secure_linux_cis::rules::ensure_talk_server_is_not_enabled {
  service { 'ntalk':
    ensure => stopped,
    enable => false,
  }
}
