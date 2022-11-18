# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_cryptographic_mechanisms_are_used_to_protect_the_integrity_of_audit_tools
class secure_linux_cis::rules::ensure_cryptographic_mechanisms_are_used_to_protect_the_integrity_of_audit_tools {
  $system_audit_rules = @(SYSTEMAUDITRULES/L)
    # Audit Tools
    /sbin/auditctl p+i+n+u+g+s+b+acl+xattrs+sha512
    /sbin/auditd p+i+n+u+g+s+b+acl+xattrs+sha512
    /sbin/ausearch p+i+n+u+g+s+b+acl+xattrs+sha512
    /sbin/aureport p+i+n+u+g+s+b+acl+xattrs+sha512
    /sbin/autrace p+i+n+u+g+s+b+acl+xattrs+sha512
    /sbin/augenrules p+i+n+u+g+s+b+acl+xattrs+sha512
    | SYSTEMAUDITRULES

  file { '/etc/aide/aide.conf.d/00-cryptographic-mechanisms.conf':
    ensure  => file,
    content => $system_audit_rules,
  }
}
