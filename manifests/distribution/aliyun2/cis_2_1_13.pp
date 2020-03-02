# @api private
#
class secure_linux_cis::distribution::aliyun2::cis_2_1_13 {
  include secure_linux_cis::rules::ensure_http_proxy_server_is_not_enabled
}
