#
class secure_linux_cis::cis_amazon2::cis_4_1 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::configure_system_accounting
}
