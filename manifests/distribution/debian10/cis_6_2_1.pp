# @api private
#
class secure_linux_cis::distribution::debian10::cis_6_2_1 {
  include secure_linux_cis::rules::ensure_password_fields_are_not_empty
}
