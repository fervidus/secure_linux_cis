# frozen_string_literal: true

# audit_priv.rb
# Lists the audit commands to satisfy cis 4_1_12
# Any privileged command (setuid, setgid) should be audited.

Facter.add('audit_privileged') do
  confine osfamily: 'RedHat'
  setcode do
    Facter::Core::Execution.exec('/usr/share/cis_scripts/audit_priv.sh')
  end
end
