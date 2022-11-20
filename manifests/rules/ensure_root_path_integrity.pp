# @api private
#  Ensure root PATH Integrity (Scored)
#
# @summary  Ensure root PATH Integrity (Scored)
#
class secure_linux_cis::rules::ensure_root_path_integrity {
  $root_path_dirs = split($facts['root_path'], /:/)

  $root_path_dirs.each | Stdlib::Absolutepath $path | {
    file { $path:
      ensure => directory,
      owner  => 'root',
      mode   => 'go-w',
    }
  }
}
