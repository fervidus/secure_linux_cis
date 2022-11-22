# @api private
#
# @summary Ensure shadow group is empty 
#
class secure_linux_cis::rules::ensure_shadow_group_is_empty {
  unless $facts['shadowgroup'].empty {
    notify { 'shadow':
      message  => 'Not in compliance with CIS 6.2.20 (Scored). Someone is a member of the group shadow. Check the shadowgroup fact for details',#lint:ignore:140chars
      loglevel => 'warning',
    }
  }
}
