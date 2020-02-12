# @api private
#
class secure_linux_cis::distribution::ubuntu18::cis_5_2_3 {
  include secure_linux_cis::rules::ensure_ssh_loglevel_is_set_to_info
}
