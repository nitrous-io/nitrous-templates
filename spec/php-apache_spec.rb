require "serverspec"
require "docker"

describe "php-apache" do
  before(:all) do
    @container_php_apache = Docker::Container.create('Image' => "quay.io/nitrous/php-apache", "Cmd" => ["/sbin/init", "--default-console", "none"])
    @container_php_apache.start

    set :os, family: :debian
    set :backend, :docker
    set :docker_container, @container_php_apache.id

    sleep(1)
  end

  describe port(3000) do
    it { should be_listening }
  end

  describe package("apache2") do
    it { should be_installed.with_version('2.4.7-1ubuntu4.5') }
  end

  describe file("#{NitrousHelper::HOME}/code/public_html/index.php") do
    it { should exist }
    it { should be_readable }
  end

  after(:all) do
    @container_php_apache.stop
    @container_php_apache.delete
  end
end
