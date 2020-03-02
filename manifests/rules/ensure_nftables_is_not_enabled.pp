# @param enforced Should this rule be enforced
# @api private
# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_nftables_is_not_enabled
class secure_linux_cis::rules::ensure_nftables_is_not_enabled(
    Boolean $enforced = true,
) {
  if $enforced {
    service { 'nftables':
      ensure   => stopped,
      schedule => 'harden_schedule',
      enable   => mask,
    }
  }
}
