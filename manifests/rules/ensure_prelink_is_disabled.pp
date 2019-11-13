#  Ensure prelink is disabled (Scored)
#
#
# Description:
# prelinkis a program that modifies ELF shared libraries and ELF dynamically linked binaries in such a way that the time
# needed for the dynamic linker to perform relocations at startup significantly decreases.
#
# @summary  Ensure prelink is disabled (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_prelink_is_disabled
class secure_linux_cis::ensure_prelink_is_disabled (
  Boolean $enforced = true,
) {

  if $enforced {

    package { 'prelink':
      ensure => purged,
    }
  }
}
