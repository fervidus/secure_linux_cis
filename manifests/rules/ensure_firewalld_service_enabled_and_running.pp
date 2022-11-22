# @api private
#
# @summary Ensure firewalld service enabled and running 
#
class secure_linux_cis::rules::ensure_firewalld_service_enabled_and_running {
  include secure_linux_cis::rules::ensure_firewalld_service_is_enabled_and_running
}
