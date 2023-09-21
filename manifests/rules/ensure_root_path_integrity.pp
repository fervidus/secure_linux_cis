# @api private
#
# @summary Ensure root PATH Integrity 
#
class secure_linux_cis::rules::ensure_root_path_integrity {
  $root_path_dirs = split($facts['root_path'], /:/)

  $root_path_dirs.each | Stdlib::Absolutepath $path | {
    exec { "check $path recursively":
      path    => ['/bin', '/sbin', '/usr/bin', '/usr/sbin'],
      command => "mkdir -p ${path}",
      creates => $path,
    }
    file { $path:
      ensure => directory,
      owner  => 'root',
      mode   => 'go-w',
      recurse => true,
    }
  }
}
