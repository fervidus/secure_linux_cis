# @param enforced Should this rule be enforced
# @api private
# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_default_zone
class secure_linux_cis::rules::ensure_default_zone(
    Boolean $enforced = true,
) {
  if($enforced) {
    include ::secure_linux_cis::rules::ensure_default_zone_is_set
  }
}
