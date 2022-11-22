# @api private
#
# @summary Ensure a single time synchronization daemon is in use
#
class secure_linux_cis::rules::ensure_a_single_time_synchronization_daemon_is_in_use {
  # This benchmark is handled by either secure_linux_cis::ensure_time_synchronization_is_in_use
  # or secure_linux_cis::ensure_time_synchronization_is_in_use depending on whether ntp or
  # chrony is used for time synchronization.
}
