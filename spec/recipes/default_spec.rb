require_relative '../spec_helper'

describe 'php::default' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  context 'on freebsd' do
    cached(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'freebsd', version: '11.2')
                          .converge(described_recipe)
    end

    it 'installs php' do
      expect(chef_run).to install_package('php56')
      expect(chef_run).not_to install_package('php5-cgi')
    end

    it 'installs pear' do
      expect(chef_run).to install_package('pear')
    end

    it 'creates php.ini' do
      expect(chef_run).to create_template('/usr/local/etc/php.ini')
    end
  end

  context 'on amazon linux' do
    cached(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'amazon', version: '2017.09')
                          .converge(described_recipe)
    end

    it 'installs php and pear' do
      expect(chef_run).to install_package(['php56', 'php56-devel', 'php-pear'])
    end

    it 'creates php.ini' do
      expect(chef_run).to create_template('/etc/php.ini')
    end
  end

  context 'on centos 6' do
    cached(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: '6.9')
                          .converge(described_recipe)
    end

    it 'installs php and pear' do
      expect(chef_run).to install_package(['php', 'php-devel', 'php-cli', 'php-pear'])
    end

    it 'creates php.ini' do
      expect(chef_run).to create_template('/etc/php.ini')
    end
  end

  context 'on centos 7' do
    cached(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: '7.3.1611')
                          .converge(described_recipe)
    end

    it 'installs php and pear' do
      expect(chef_run).to install_package(['php', 'php-devel', 'php-cli', 'php-pear'])
    end

    it 'creates php.ini' do
      expect(chef_run).to create_template('/etc/php.ini')
    end
  end

  context 'on debian 8' do
    cached(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'debian', version: '8.10')
                          .converge(described_recipe)
    end

    it 'installs php and pear' do
      expect(chef_run).to install_package(['php5-cgi', 'php5', 'php5-dev', 'php5-cli', 'php-pear'])
    end

    it 'creates php.ini' do
      expect(chef_run).to create_template('/etc/php5/cli/php.ini')
    end
  end

  context 'on debian 9' do
    cached(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'debian', version: '9.3')
                          .converge(described_recipe)
    end

    it 'installs php and pear' do
      expect(chef_run).to install_package(['php7.0-cgi', 'php7.0', 'php7.0-dev', 'php7.0-cli', 'php-pear'])
    end

    it 'creates php.ini' do
      expect(chef_run).to create_template('/etc/php/7.0/cli/php.ini')
    end
  end

  context 'on ubuntu 14.04' do
    cached(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04')
                          .converge(described_recipe)
    end

    it 'installs php and pear' do
      expect(chef_run).to install_package(['php7.0-cgi', 'php7.0', 'php7.0-dev', 'php7.0-cli', 'php-pear'])
    end

    it 'creates php.ini' do
      expect(chef_run).to create_template('/etc/php/7.0/cli/php.ini')
    end
  end

  context 'on ubuntu 16.04' do
    cached(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04')
                          .converge(described_recipe)
    end

    it 'installs php and pear' do
      expect(chef_run).to install_package(['php7.0-cgi', 'php7.0', 'php7.0-dev', 'php7.0-cli', 'php-pear'])
    end

    it 'creates php.ini' do
      expect(chef_run).to create_template('/etc/php/7.0/cli/php.ini')
    end
  end

  context 'on ubuntu 18.04' do
    cached(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04')
                          .converge(described_recipe)
    end

    it 'installs php and pear' do
      expect(chef_run).to install_package(['php7.2-cgi', 'php7.2', 'php7.2-dev', 'php7.2-cli', 'php-pear'])
    end

    it 'creates php.ini' do
      expect(chef_run).to create_template('/etc/php/7.2/cli/php.ini')
    end
  end
end
