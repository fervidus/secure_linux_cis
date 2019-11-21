require 'find'

Facter.add('ssh_host_keys') do
  confine kernel: 'Linux'
  setcode do
    keys = []
    Find.find('/etc/ssh') do |path|
      next unless File.file?(path)
      if path =~ %r{/etc/ssh/ssh_host_.*_key$}
        keys << path
      end
    end
    keys
  end
end
