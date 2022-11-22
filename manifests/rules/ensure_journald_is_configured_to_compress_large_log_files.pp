# @api private
#
# @summary Ensure journald is configured to compress large log files 
#
class secure_linux_cis::rules::ensure_journald_is_configured_to_compress_large_log_files {
  file_line { 'journald_compress':
    path     => '/etc/systemd/journald.conf',
    line     => 'Compress=yes',
    match    => '^Compress\ *=',
    multiple => true,
  }
}
