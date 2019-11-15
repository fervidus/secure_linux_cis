require 'spec_helper'

describe 'secure_linux_cis' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      pp os_facts[:os]['name']
      pp os_facts[:os]['release']['major']

      it { is_expected.to compile }
    end
  end
end
