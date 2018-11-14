# 5.4.2 Ensure system accounts are non-login (Scored)
#
#
# Description:
# There are a number of accounts provided with Red Hat 7 that are used to manage applications and are not intended to provide
# an interactive shell.
#
# @summary 5.4.2 Ensure system accounts are non-login (Scored)
#
# @exampl e
#   include secure_linux_cis::redhat7::cis_5_4_2
class secure_linux_cis::redhat7::cis_5_4_2 (
  Boolean $enforced = true,
) {

  if $enforced {

    if $facts['nologin'] != [] {

      $facts['nologin'].each | String $user | {
        exec { "nologin ${user}":
          command => "usermod -s /sbin/nologin ${user}",
          path    => '/sbin/',
        }
      }

    }
  }
}
