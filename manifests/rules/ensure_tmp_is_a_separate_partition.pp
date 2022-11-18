# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_tmp_is_a_separate_partition
class secure_linux_cis::rules::ensure_tmp_is_a_separate_partition {
  include secure_linux_cis::rules::ensure_tmp_is_configured
}
