#
class secure_linux_cis::cis_ubuntu18::cis_3_1 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::network_parameters
}
