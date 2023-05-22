# @api private
#
# @summary Ensure root PATH Integrity
#
class secure_linux_cis::rules::ensure_root_path_integrity {
  $root_path_dirs = split($facts['root_path'], /:/)

  $root_path_dirs.each | Stdlib::Absolutepath $path | {
    file { $path:
      ensure => present,
      owner  => 'root',
      mode   => 'go-w',
    }
  }
}
