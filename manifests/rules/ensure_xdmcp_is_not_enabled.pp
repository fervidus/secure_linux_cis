# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
class secure_linux_cis::rules::ensure_xdmcp_is_not_enabled {
  file { '/etc/gdm/custom.conf':
    ensure => file,
  }

  file_line { 'Disable XDMCP':
    ensure  => present,
    path    => '/etc/gdm/custom.conf',
    line    => 'Enable=true',
    match   => '^\s*(E|e)nable\s*=',
    require => File['/etc/gdm/custom.conf'],
  }
}
