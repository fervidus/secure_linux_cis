require 'spec_helper'

describe 'secure_linux_cis::rules::ensure_default_zone_is_set' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
    end
  end
end
