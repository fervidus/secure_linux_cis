# @api private
#  Ensure prelink is disabled (Scored)
#
# Description:
# prelinkis a program that modifies ELF shared libraries and ELF dynamically linked binaries in such a way that the time
# needed for the dynamic linker to perform relocations at startup significantly decreases.
#
# @summary  Ensure prelink is disabled (Scored)
#
class secure_linux_cis::rules::ensure_prelink_is_disabled {
  case $facts['os']['family'] {
    'Suse': {
      package { 'prelink':
        ensure   => absent,
      }
    }
    default: {
      package { 'prelink':
        ensure   => absent,
      }
    }
  }
}
