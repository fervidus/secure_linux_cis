# 1.5.4 Ensure prelink is disabled (Scored)
#
#
# Description:
# prelinkis a program that modifies ELF shared libraries and ELF dynamically linked binaries in such a way that the time
# needed for the dynamic linker to perform relocations at startup significantly decreases.
#
# @summary 1.5.4 Ensure prelink is disabled (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_1_5_4
class secure_linux_cis::redhat7::cis_1_5_4 (
  Boolean $enforced = true,
) {

  if $enforced {

    package { 'prelink':
      ensure => purged,
    }
  }
}
