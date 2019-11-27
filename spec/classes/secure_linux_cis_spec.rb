require 'spec_helper'

describe 'secure_linux_cis' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      # Architecutre fact not included
      os_facts[:os]['architecture'] = 'x64'

      let(:facts) { os_facts }

      # pp os_facts[:os]['name'] + ' ' + os_facts[:os]['release']['major'] + ' ' + os_facts[:os]['architecture'] + ' ' + os_facts[:os]['family']

      it { is_expected.to compile }
    end
  end
end
