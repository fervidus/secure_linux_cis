# 1.1.21 Ensure sticky bit is set on all world-writable directories (Scored)
#
#
# Description:
# Setting the sticky bit on world writable directories prevents users from deleting or renaming files in that directory
# that are not owned by them.
#
# @summary 1.1.21 Ensure sticky bit is set on all world-writable directories (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_1_1_21
class secure_linux_cis::redhat7::cis_1_1_21 (
  Boolean $enforced = true,
  ) {
    if $enforced {

      if $facts['sticky_ww'] {

        exec { "df --local -P | awk {'if (NR!=1) print \$6'} | xargs -I '{}' find '{}' -xdev -type d -perm -0002 2>/dev/null | xargs chmod a+t":#lint:ignore:140chars
          path => '/bin/',
        }
      }
    }
}
