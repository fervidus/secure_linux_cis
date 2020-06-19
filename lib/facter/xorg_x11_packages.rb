# frozen_string_literal: true

# This fact xorg_x11_packages returns an array of installed packages that start with xorg-x11*
#
Facter.add('xorg_x11_packages') do
  confine osfamily: 'RedHat'
  confine kernel: :linux
  setcode do
    package_list = Facter::Core::Execution.exec('rpm --qf "%{NAME}\n" -qa xorg-x11*')
    package_list.split("\n")
  end
end
Facter.add('xorg_x11_packages') do
  confine osfamily: 'Debian'
  confine kernel: :linux
  setcode do
    package_list = Facter::Core::Execution.exec("dpkg-query --showformat='${Package}\n' -W xserver-xorg*")
    package_list.split("\n")
  end
end
