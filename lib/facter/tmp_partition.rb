# tmp_partition.rb
# Makes sure that /tmp is mounted

Facter.add('tmp_partition') do
  setcode 'mount | grep /tmp'
end
