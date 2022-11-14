# frozen_string_literal: true

require 'spec_helper'

describe 'secure_linux_cis::rules::ensure_accounts_in_etc_passwd_use_shadowed_passwords' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
    end
  end
end
