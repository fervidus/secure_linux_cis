#
class secure_linux_cis::amazon1::cis_4_1_11 {
  include secure_linux_cis::rules::ensure_unsuccessful_unauthorized_file_access_attempts_are_collected
}