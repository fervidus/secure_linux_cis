#
class secure_linux_cis::amazon2::cis_3_1 (
  Boolean $enforced = true,
) {
  include secure_linux_cis::rules::network_parameters
}
