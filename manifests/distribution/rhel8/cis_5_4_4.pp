# @api private
#
class secure_linux_cis::distribution::rhel8::cis_5_4_4 {
  include secure_linux_cis::rules::ensure_password_hashing_algorithm_is_sha_512
}
