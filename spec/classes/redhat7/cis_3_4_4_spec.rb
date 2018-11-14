require 'spec_helper'

describe 'secure_linux_cis::redhat7::cis_3_4_4' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
    end
  end
end
