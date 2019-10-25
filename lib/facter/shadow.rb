require 'etc'

Facter.add('shadowgroup') do
  confine osfamily: 'Debian'
  setcode do
    shadowgid = Etc.getgrnam('shadow').gid
    members = Etc.getgrnam('shadow').mem
    Etc.passwd do |user|
      if user.gid == shadowgid
        members << user.name
      end
    end
    members
  end
end
