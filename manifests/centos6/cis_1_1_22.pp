#
class secure_linux_cis::cis_centos6::cis_1_1_22 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::disable_automounting
}
