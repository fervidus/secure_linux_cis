# @api private
#
class secure_linux_cis::distribution::centos7::cis_1_6_1_4 {
  include secure_linux_cis::rules::ensure_setroubleshoot_is_not_installed
}
