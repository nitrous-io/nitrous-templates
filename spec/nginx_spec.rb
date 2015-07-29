require "serverspec"
require "docker"

describe "nginx" do
  before(:all) do
    @container_nginx = Docker::Container.create('Image' => "quay.io/nitrous/nginx", "Cmd" => ["/sbin/init", "--default-console", "none"])
    @container_nginx.start

    set :os, family: :debian
    set :backend, :docker
    set :docker_container, @container_nginx.id

    sleep(1)
  end

  describe port(3000) do
    it { should be_listening }
  end

  describe package("nginx") do
    it { should be_installed }
  end

  describe file("#{NitrousHelper::HOME}/code/public_html/index.html") do
    it { should exist }
    it { should be_readable }
  end

  after(:all) do
    @container_nginx.stop
    @container_nginx.delete
  end
end
