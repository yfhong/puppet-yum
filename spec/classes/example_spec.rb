require 'spec_helper'

describe 'yum' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "yum class without any parameters" do
          let(:params) {{ }}

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('yum::params') }
          it { is_expected.to contain_class('yum::install').that_comes_before('yum::config') }
          it { is_expected.to contain_class('yum::config') }
          it { is_expected.to contain_class('yum::service').that_subscribes_to('yum::config') }

          it { is_expected.to contain_service('yum') }
          it { is_expected.to contain_package('yum').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'yum class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { is_expected.to contain_package('yum') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
