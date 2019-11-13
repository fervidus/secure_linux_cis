#
class secure_linux_cis::cis_centos7::cis_4_1_3 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_auditing_for_processes_that_start_prior_to_auditd_is_enabled
}
