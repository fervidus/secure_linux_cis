# @api private
#  Ensure address space layout randomization (ASLR) is enabled (Scored)
#
#
# Description:
# Address space layout randomization (ASLR) is an exploit mitigation technique which randomly arranges the address space
# of key data areas of a process.
#
# @summary  Ensure address space layout randomization (ASLR) is enabled (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_address_space_layout_randomization_aslr_is_enabled
class secure_linux_cis::rules::ensure_address_space_layout_randomization_aslr_is_enabled(
    Boolean $enforced = true,
) {
  if $enforced {
    sysctl { 'kernel.randomize_va_space':
      value    => 2,
      schedule => 'harden_schedule',
    }
  }
}
