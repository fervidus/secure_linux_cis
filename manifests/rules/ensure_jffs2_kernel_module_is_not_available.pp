# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_jffs2_kernel_module_is_not_available
class secure_linux_cis::rules::ensure_jffs2_kernel_module_is_not_available {
  kmod::install { 'jffs2': command => '/bin/false' }
  kmod::blacklist { 'jffs2': }
}
