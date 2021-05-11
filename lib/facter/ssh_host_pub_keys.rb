require 'find'

Facter.add('ssh_host_pub_keys') do
  confine kernel: 'Linux'
  setcode do
    keys = []
    Find.find('/etc/ssh') do |path|
      next unless File.file?(path)
      if %r{/etc/ssh/ssh_host_.*_key\.pub$}.match?(path)
        keys << path
      end
    end
    keys
  end
end
