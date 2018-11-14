# 3.4.5 Ensure permissions on /etc/hosts.deny are configured (Scored)
#
# Description:
# The /etc/hosts.deny file contains network information that is used by many system
# applications and therefore must be readable for these applications to operate.
#
# Rationale:
# It is critical to ensure that the /etc/hosts.deny file is protected from unauthorized write
# access. Although it is protected by default, the file permissions could be changed either
# inadvertently or through malicious actions.
#
# @summary A short summary of the purpose of this class
#
# @example
#   include secure_linux_cis::redhat7::cis_3_4_5
class secure_linux_cis::redhat7::cis_3_4_5 {

  # This benchmark is managed in secure_linux_cis::redhat7::cis_3_4_3

}
