# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_udf_kernel_module_is_not_available
class secure_linux_cis::rules::ensure_udf_kernel_module_is_not_available {
  kmod::install { 'udf': command => '/bin/false' }
  kmod::blacklist { 'udf': }
}
