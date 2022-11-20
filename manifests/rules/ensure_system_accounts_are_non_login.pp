# @api private
#  Ensure system accounts are non-login (Scored)
#
# Description:
# There are a number of accounts provided with Red Hat 7 that are used to manage applications and are not intended to provide
# an interactive shell.
#
# @summary  Ensure system accounts are non-login (Scored)
#
class secure_linux_cis::rules::ensure_system_accounts_are_non_login {
  case $facts['os']['family'] {
    'Debian': {
      $nologin = '/usr/sbin/nologin'
    }
    default: {
      $nologin = '/sbin/nologin'
    }
  }
  unless $facts['nologin'].empty {
    $facts['nologin'].each | String $user | {
      if ! ($user in $secure_linux_cis::nologin_whitelist) {
        exec { "nologin ${user}":
          command => "usermod -s ${nologin} ${user}",
          path    => '/sbin/:/usr/sbin',
        }
      }
    }
  }
}
