# 2.1.6 Ensure tftp server is not enabled (Scored)
#
# Description:
# Trivial File Transfer Protocol (TFTP) is a simple file transfer protocol,
# typically used to automatically transfer configuration or boot machines from a boot server.
# The package tftp-server is used to define and support a TFTP server.
#
# Rationale:
# TFTP does not support authentication nor does it ensure the confidentiality or integrity of data.
# It is recommended that TFTP be removed, unless there is a specific need for TFTP. In that case,
# extreme caution must be used when configuring the services.
#
# @summary 2.1.6 Ensure tftp server is not enabled (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::redhat7::cis_2_1_6
class secure_linux_cis::redhat7::cis_2_1_6 (
  Boolean $enforced = true,
) {

  if $enforced {

    service { 'tftp':
      ensure => stopped,
      enable => false,
    }

  }
}
