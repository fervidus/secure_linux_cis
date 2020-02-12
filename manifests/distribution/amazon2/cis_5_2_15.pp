# @api private
#
class secure_linux_cis::distribution::amazon2::cis_5_2_15 {
  include secure_linux_cis::rules::ensure_that_strong_key_exchange_algorithms_are_used
}
