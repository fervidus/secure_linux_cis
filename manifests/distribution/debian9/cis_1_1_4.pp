#
class secure_linux_cis::distribution::debian9::cis_1_1_4 {
  include secure_linux_cis::rules::ensure_nosuid_option_set_on_tmp_partition
}
