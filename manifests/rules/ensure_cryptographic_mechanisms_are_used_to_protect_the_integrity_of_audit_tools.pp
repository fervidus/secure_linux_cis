# @api private
#
# @summary Ensure cryptographic mechanisms are used to protect   the integrity of audit tools 
#
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

  if find_file('/etc/aide') {

    file { '/etc/aide/aide.conf.d':
      ensure  => directory,
      recurse => false,
      owner   => 'root',
      group   => 'root',
    }

    file { '/etc/aide/aide.conf.d/00-cryptographic-mechanisms.conf':
      ensure  => file,
      content => $system_audit_rules,
    }
  }
}
