# @api private
#
# @summary Ensure /etc/shadow password fields are not empty   
#
class secure_linux_cis::rules::ensure_etc_shadow_password_fields_are_not_empty {
  if($facts['no_password_accounts']) {
    $facts['no_password_accounts'].each | String $account | {
      accounts::user { $facts['no_password_accounts']:
        locked => true,
      }
    }
  }
}
