# @param enforced Should this rule be enforced
# @api private
# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_journald_is_configured_to_compress_large_log_files
class secure_linux_cis::rules::ensure_journald_is_configured_to_compress_large_log_files {
  file_line { 'journald_compress':
    schedule => 'harden_schedule',
    path     => '/etc/systemd/journald.conf',
    line     => 'Compress=yes',
    match    => '^Compress=',
    multiple => true,
  }
}
