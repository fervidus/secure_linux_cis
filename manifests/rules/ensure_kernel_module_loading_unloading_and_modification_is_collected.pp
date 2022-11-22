# @api private
#
# @summary Ensure kernel module loading unloading and   modification is collected 
#
class secure_linux_cis::rules::ensure_kernel_module_loading_unloading_and_modification_is_collected {
  $system_audit_rules = @("SYSTEMAUDITRULES"/L)
    -a always,exit -F arch=b64 -S init_module,finit_module,delete_module,create_module,query_module -F auid>=${facts['uid_min']} -F auid!=unset -k kernel_modules
    -a always,exit -F path=/usr/bin/kmod -F perm=x -F auid>=${facts['uid_min']} -F auid!=unset -k kernel_modules
    | SYSTEMAUDITRULES

  file { '/etc/audit/rules.d/50-kernel_modules.rules':
    ensure  => file,
    content => $system_audit_rules,
  }

  Class['secure_linux_cis::rules::ensure_kernel_module_loading_unloading_and_modification_is_collected']
  ~> Class['secure_linux_cis::refresh_mount_options']
}
