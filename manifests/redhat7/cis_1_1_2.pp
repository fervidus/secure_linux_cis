# 1.1.2 Ensure separate partition exists for /tmp (Scored)
#
#
# Description:
# The /tmp directory is a world-writable directory used for temporary storage by all users and some applications.
#
# @summary 1.1.2 Ensure separate partition exists for /tmp (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::redhat7::cis_1_1_2
class secure_linux_cis::redhat7::cis_1_1_2 (
  Boolean $enforced = true,
) {

  if $enforced {

    if ! $facts['mountpoints']['/tmp'] {
      notify { 'tmp-part':
        message  => 'Not in compliance with CIS 1.1.2 (Scored). There is not a seperate partition for /tmp',
        loglevel => 'warning',
        notify   => Exec['restart tmp.mount'],
      }
    }

    file { '/etc/systemd/system/local-fs.target.wants/tmp.mount':
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      source  => "puppet:///modules/${module_name}/tmp.mount",
      replace => false,
      notify  => Exec['restart tmp.mount'],
    }

    exec { 'restart tmp.mount':
      path        => '/bin:/sbin:/usr/bin:/usr/sbin',
      command     => 'systemctl restart tmp.mount',
      refreshonly => true,
      logoutput   => false,
    }


  }
}
