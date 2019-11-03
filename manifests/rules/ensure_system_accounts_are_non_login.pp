#  Ensure system accounts are non-login (Scored)
#
#
# Description:
# There are a number of accounts provided with Red Hat 7 that are used to manage applications and are not intended to provide
# an interactive shell.
#
# @summary  Ensure system accounts are non-login (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_system_accounts_are_non_login

class secure_linux_cis::rules::ensure_system_accounts_are_non_login {

    if !empty($facts['nologin']) {

      $facts['nologin'].each | String $user | {
        exec { "nologin ${user}":
          command => "usermod -s /sbin/nologin ${user}",
          path    => '/sbin/:/usr/sbin',
        }
      }
    }
  }
