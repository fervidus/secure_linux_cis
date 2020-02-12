# @api private
#
class secure_linux_cis::distribution::debian8::cis_2_2_11 {
  # CIS is not strict with this check accross distributions. Enabled and
  # installed are mixed, but the implementation of this check for both
  # Debian9 (enabled) and Debian8 (installed) actually is 'installed'.
  include secure_linux_cis::rules::ensure_imap_and_pop3_server_is_not_enabled
}
