# 4.1.7 Ensure events that modify the system's Mandatory Access Controls are collected (Scored)
#
# Description:
# Monitor SELinux mandatory access controls. The parameters below monitor any write
# access (potential additional, deletion or modification of files in the directory) or attribute
# changes to the /etc/selinux or directory.
#
# Rationale:
# Changes to files in these directories could indicate that an unauthorized user is attempting
# to modify access controls and change security contexts, leading to a compromise of the
# system.
#
# @summary 4.1.7 Ensure events that modify the system's Mandatory Access Controls are collected (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_4_1_7
class secure_linux_cis::redhat7::cis_4_1_7 (
  Boolean $enforced = true,
) {

  if $enforced {

    file_line { 'audit.rules selinux 1':
      ensure => present,
      path   => '/etc/audit/audit.rules',
      line   => '-w /etc/selinux/ -p wa -k MAC-policy',
    }

    file_line { 'audit.rules selinux 2':
      ensure => present,
      path   => '/etc/audit/audit.rules',
      line   => '-w /usr/share/selinux/ -p wa -k MAC-policy',
    }
  }
}
