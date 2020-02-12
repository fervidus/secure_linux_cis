# @api private
#
class secure_linux_cis::distribution::rhel6::cis_4_1_17 {
  include secure_linux_cis::rules::ensure_kernel_module_loading_and_unloading_is_collected
}
