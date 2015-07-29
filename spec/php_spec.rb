require "serverspec"
require "docker"

describe "php" do
  before(:all) do
    @container_php = Docker::Container.create('Image' => "quay.io/nitrous/php", "Cmd" => ["/sbin/init", "--default-console", "none"])
    @container_php.start

    set :os, family: :debian
    set :backend, :docker
    set :docker_container, @container_php.id
  end

  describe package('mysql-server') do
    it { should be_installed }
  end

  describe command('php -v') do
    its(:stdout) { should match /5.5.9-1ubuntu4.11/}
  end

  describe command('heroku --version') do
    its(:stdout) { should match /heroku-toolbelt/ }
  end

  after(:all) do
    @container_php.stop
    @container_php.delete
  end
end
