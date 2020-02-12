# @api private
#
class secure_linux_cis::distribution::debian9::cis_5_2_13 {
  include secure_linux_cis::rules::ensure_only_strong_ciphers_are_used
}
