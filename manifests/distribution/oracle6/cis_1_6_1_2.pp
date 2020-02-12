# @api private
#
class secure_linux_cis::distribution::oracle6::cis_1_6_1_2 {
  include secure_linux_cis::rules::ensure_the_selinux_state_is_enforcing
}
