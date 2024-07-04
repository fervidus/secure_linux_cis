# frozen_string_literal: true

require 'spec_helper'

describe 'secure_linux_cis::rules::ensure_nis_server_services_are_not_in_use' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile.with_all_deps }
    end
  end
end
