# 5.2.9 Ensure SSH PermitEmptyPasswords is disabled (Scored)
#
# Description:
# The PermitEmptyPasswords parameter specifies if the SSH server allows login to accounts with empty password strings.
#
# Rationale:
# Disallowing remote shell access to accounts that have an empty password reduces the probability of unauthorized access to the system
#
# @summary 5.2.9 Ensure SSH PermitEmptyPasswords is disabled (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_5_2_9
class secure_linux_cis::redhat7::cis_5_2_9 (
  Boolean $enforced = true,
) {

  if $enforced {

    file_line { 'ssh permit empty password':
        ensure => 'present',
        path   => '/etc/ssh/sshd_config',
        line   => 'PermitEmptyPasswords no',
        match  => '^#?PermitEmptyPasswords',
    }
  }
}
