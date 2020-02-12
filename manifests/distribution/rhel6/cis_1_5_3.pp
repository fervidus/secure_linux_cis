# @api private
#
class secure_linux_cis::distribution::rhel6::cis_1_5_3 {
  include secure_linux_cis::rules::ensure_address_space_layout_randomization_aslr_is_enabled
}
