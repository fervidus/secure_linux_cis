# @api private
#
# @summary Ensure gpgcheck is globally activated 
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
