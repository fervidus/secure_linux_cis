# @api private
#
# @summary Ensure filesystem integrity is regularly checked 
#
class secure_linux_cis::rules::ensure_filesystem_integrity_is_regularly_checked {
  file { '/etc/systemd/system/aidecheck.service':
    ensure => file,
    source => 'puppet:///modules/secure_linux_cis/aidecheck.service',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  file { '/etc/systemd/system/aidecheck.timer':
    ensure => file,
    source => 'puppet:///modules/secure_linux_cis/aidecheck.timer',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  service { 'aidecheck.service':
    ensure    => running,
    enable    => true,
    subscribe => File['/etc/systemd/system/aidecheck.service'],
  }

  service { 'aidecheck.timer':
    ensure    => running,
    enable    => true,
    subscribe => File['/etc/systemd/system/aidecheck.timer'],
  }
}
