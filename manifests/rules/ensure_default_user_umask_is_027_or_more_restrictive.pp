# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_default_user_umask_is_027_or_more_restrictive
class secure_linux_cis::rules::ensure_default_user_umask_is_027_or_more_restrictive {
  $bashrc = $facts['os']['family'] ? {
    'Suse'   => '/etc/bash.bashrc',
    'RedHat' => '/etc/bashrc',
    'Debian' => '/etc/bash.bashrc',
  }

  file_line { 'bashrc':
    path     => $bashrc,
    line     => '      umask 077',
    match    => '^\s*umask\s+\d+',
    multiple => true,
  }

  file_line { 'profile':
    path     => '/etc/profile',
    line     => '    umask 077',
    match    => '^\s*umask\s+\d+',
    multiple => true,
  }

  file_line { 'login.defs':
    path  => '/etc/login.defs',
    line  => 'UMASK           077',
    match => '^\s*umask\s+\d+',
  }

  if $facts['os']['family'] == 'RedHat' {
    file_line { 'csh.cshrc':
      path     => '/etc/csh.cshrc',
      line     => '    umask 077',
      match    => '^\s*umask\s+\d+',
      multiple => true,
    }
  }
}
