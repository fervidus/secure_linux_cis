# @api private
#
class secure_linux_cis::distribution::centos7::cis_2_1_2 {
  include secure_linux_cis::rules::ensure_daytime_services_are_not_enabled
}
