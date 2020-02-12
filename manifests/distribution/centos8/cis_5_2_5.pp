# @api private
#
class secure_linux_cis::distribution::centos8::cis_5_2_5 {
  include secure_linux_cis::rules::ensure_SSH_LogLevel_is_appropriate
}
