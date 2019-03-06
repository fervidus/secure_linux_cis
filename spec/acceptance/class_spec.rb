require 'spec_helper_acceptance'

describe 'secure_linux_cis' do
  context 'with default parameters' do
    # Using puppet_apply as a helper
    it 'works idempotently with no errors' do
      pp = <<-LINUX_TEST
      class { 'secure_linux_cis': }
      LINUX_TEST

      # Run it twice and test for idempotency
      apply_manifest(pp, catch_failures: true)
      apply_manifest(pp, catch_changes: true)
    end
  end
end
