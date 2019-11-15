#
class secure_linux_cis::aliyun1::cis_5_2_7 {
  include secure_linux_cis::rules::ensure_ssh_maxauthtries_is_set_to_4_or_less
}
