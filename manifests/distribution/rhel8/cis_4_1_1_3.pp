# @api private
#
class secure_linux_cis::distribution::rhel8::cis_4_1_1_3 {
  include secure_linux_cis::rules::ensure_auditing_for_processes_that_start_prior_to_auditd_is_enabled
}
