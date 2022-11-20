# @api private
# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
class secure_linux_cis::rules::ensure_journald_is_configured_to_write_logfiles_to_persistent_disk {
  file_line { 'journald_persist':
    path     => '/etc/systemd/journald.conf',
    line     => 'Storage=persistent',
    match    => '^Storage\ *=',
    multiple => true,
  }
}
