# @api private
#
# @summary Ensure journald is configured to write logfiles to persistent disk 
#
class secure_linux_cis::rules::ensure_journald_is_configured_to_write_logfiles_to_persistent_disk {
  file_line { 'journald_persist':
    path     => '/etc/systemd/journald.conf',
    line     => 'Storage=persistent',
    match    => '^Storage\ *=',
    multiple => true,
  }
}
