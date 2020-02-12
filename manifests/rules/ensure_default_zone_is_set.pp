# @param enforced Should this rule be enforced
# @api private
# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_default_zone_is_set
class secure_linux_cis::rules::ensure_default_zone_is_set(
    Boolean $enforced = true,
) {
  # if $enforced {
  #   class { '::firewalld':
  #     default_zone              => 'drop',
  #     purge_direct_rules        => true,
  #     purge_direct_chains       => true,
  #     purge_direct_passthroughs => true,
  #   }
  # }
}
