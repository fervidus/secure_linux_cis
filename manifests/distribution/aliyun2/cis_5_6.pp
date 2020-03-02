# @api private
#
class secure_linux_cis::distribution::aliyun2::cis_5_6 {
  include secure_linux_cis::rules::ensure_access_to_the_su_command_is_restricted
}
