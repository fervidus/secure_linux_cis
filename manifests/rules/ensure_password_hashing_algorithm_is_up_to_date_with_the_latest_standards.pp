# @api private
#
# @summary Ensure password hashing algorithm is up to date with the latest standards 
#
class secure_linux_cis::rules::ensure_password_hashing_algorithm_is_up_to_date_with_the_latest_standards {
  # TODO check hashing algorithm
  file_line { 'Ensure ENCRYPT_METHOD set properly':
    path  => '/etc/login.defs',
    match => '^\s*ENCRYPT_METHOD',
    line  => 'ENCRYPT_METHOD yescrypt',
  }
}
