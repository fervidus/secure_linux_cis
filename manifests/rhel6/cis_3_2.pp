#
class secure_linux_cis::cis_rhel6::cis_3_2 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::network_parameters
}
