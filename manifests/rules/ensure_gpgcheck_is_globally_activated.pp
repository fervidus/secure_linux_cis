# @api private
#  Ensure gpgcheck is globally activated (Scored)
#
# Description:
# Most packages managers implement GPG key signing to verify package integrity during installation.
#
# @summary  Ensure gpgcheck is globally activated (Scored)
#
class secure_linux_cis::rules::ensure_gpgcheck_is_globally_activated (
  Stdlib::Absolutepath $package_configuration,
) {
  file_line { 'gpgcheck':
    ensure => present,
    after  => '[main]',
    path   => $package_configuration,
    line   => 'gpgcheck=1',
    match  => '^gpgcheck',
  }
}
