#
class secure_linux_cis::ubuntu18::cis_5_2_10 {
  include secure_linux_cis::rules::ensure_ssh_permituserenvironment_is_disabled
}