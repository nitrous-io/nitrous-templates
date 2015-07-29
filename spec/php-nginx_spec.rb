require "serverspec"
require "docker"

describe "php-nginx" do
  before(:all) do
    @container_php_nginx = Docker::Container.create('Image' => "quay.io/nitrous/php-nginx", "Cmd" => ["/sbin/init", "--default-console", "none"])
    @container_php_nginx.start

    set :os, family: :debian
    set :backend, :docker
    set :docker_container, @container_php_nginx.id

    sleep(1)
  end

  describe port(3000) do
    it { should be_listening }
  end

  describe package("nginx") do
    it { should be_installed.with_version('1.8.0-1+trusty1') }
  end

  describe file("#{NitrousHelper::HOME}/code/public_html/index.php") do
    it { should exist }
    it { should be_readable }
  end

  after(:all) do
    @container_php_nginx.stop
    @container_php_nginx.delete
  end
end
