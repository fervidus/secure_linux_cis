# 5.2.2 Ensure SSH Protocol is set to 2 (Scored)
#
# Description:
# SSH supports two different and incompatible protocols: SSH1 and SSH2. SSH1 was
# the original protocol and was subject to security issues. SSH2 is more advanced
# and secure.
#
# Rationale:
# SSH v1 suffers from insecurities that do not affect SSH v2.
#
# @summary 5.2.2 Ensure SSH Protocol is set to 2 (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_5_2_2
class secure_linux_cis::redhat7::cis_5_2_2 (
  Boolean $enforced = true,
) {

  if $enforced {

    file_line { 'ssh protocol':
      ensure => present,
      path   => '/etc/ssh/sshd_config',
      line   => 'Protocol 2',
      match  => '^Protocol.*',
    }
  }
}
