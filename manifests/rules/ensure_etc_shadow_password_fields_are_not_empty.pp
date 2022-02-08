# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_etc_shadow_password_fields_are_not_empty
class secure_linux_cis::rules::ensure_etc_shadow_password_fields_are_not_empty {
  if($facts['no_password_accounts']) {
    $facts['no_password_accounts'].each | String $account | {
      accounts::user { $facts['no_password_accounts']:
        locked => true,
      }
    }
  }
}
