Facter.add('insecure_system_accounts') do
  confine osfamily: 'RedHat'
  confine operatingsystemmajrelease: '8'

  setcode do
    # TODO: get value "UID_MIN" from /etc/login.defs into a variable
    #       use it in regex below for (exclude greater than value) AND
    #       nologin AND /bin/false not set per:
    #
    #       5.5.2 Ensure system accounts are secured (Scored)

    # somehow turn this into a variable:
    if File.exist? '/etc/login.defs'
      uid_min = Facter::Core::Execution.execute('/usr/bin/grep ^UID_MIN /etc/login.defs | /usr/bin/sed \'s/.* //g\'')
    end
    # stupid complex regex goes here using variable and other stuff:
    passwd_items_array = File.readlines('/etc/passwd')

    insecure_system_accounts = passwd_items_array.reject do |item|
      item[0] =~ %r{^(?!.*(^root|^sync|^shutdown|^halt)).*$}
      item[2] < uid_min
      item[6] =~ %r{(/bin/false|/sbin/nologin)}
    end

    insecure_system_accounts
  end
end
