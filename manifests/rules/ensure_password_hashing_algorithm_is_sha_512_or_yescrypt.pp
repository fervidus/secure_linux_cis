# @api private
#
# @summary Ensure password hashing algorithm is SHA-512 or yescrypt
#
class secure_linux_cis::rules::ensure_password_hashing_algorithm_is_sha_512_or_yescrypt (
    String $crypt_style_login_defs = 'SHA512',
    String $encrypt_method_libuser_conf = 'sha512',

) {
  file_line { 'Ensure ENCRYPT_METHOD set properly':
    path  => '/etc/login.defs',
    match => '^\s*ENCRYPT_METHOD\s+',
    line  => "ENCRYPT_METHOD $crypt_style_login_defs",
  }
  file_line { 'ensure crypt_style is set to sha512 in /etc/libuser.conf':
    ensure => present,
    path   => '/etc/libuser.conf',
    match  => '^\s*crypt_style\s*=',
    line   => "crypt_style = $encrypt_method_libuser_conf",
    multiple  => true,
  }
  exec { "Ensure password hashing algorithm is SHA-512 or yescrypt":
    command   => "/usr/share/cis_scripts/ensure_password_hashing_algorithm_is_sha_512_or_yescrypt.sh",
    logoutput => true,
  }
}
