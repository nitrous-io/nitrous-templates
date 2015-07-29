require "serverspec"
require "docker"

describe "wordpress", tag: :nitrous do

  before(:all) do
    @container_wordpress = Docker::Container.create('Image' => "quay.io/nitrous/wordpress", "Cmd" => ["/sbin/init", "--default-console", "none"])
    @container_wordpress.start
    set :os, family: :debian
    set :backend, :docker
    set :docker_container, @container_wordpress.id

    sleep(2)
  end

  describe port(3000) do
    it { should be_listening }
  end

  after(:all) do
    @container_wordpress.stop
    @container_wordpress.delete
  end
end
