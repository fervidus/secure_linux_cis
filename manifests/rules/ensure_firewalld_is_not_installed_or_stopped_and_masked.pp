# @api private
#
# @summary Ensure firewalld is not installed or stopped and masked 
#
class secure_linux_cis::rules::ensure_firewalld_is_not_installed_or_stopped_and_masked {
  package { 'firewalld':
    ensure => absent,
  }
}
