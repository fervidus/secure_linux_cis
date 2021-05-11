# frozen_string_literal: true

Facter.add('no_password_accounts') do
  confine kernel: 'Linux'
  setcode do
    begin
      account_list = Facter::Core::Execution.exec('awk -F: \'($2 == "" ) { print $1 }\' /etc/shadow')
    rescue => exception
      account_list = nil
    end

    if account_list.empty? || account_list.nil?
      []
    else
      account_list.split("\n")
    end
  end
end
