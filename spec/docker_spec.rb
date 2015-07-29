require "serverspec"
require "docker"

describe "docker" do
  before(:all) do
    @container = Docker::Container.create('Image' => "quay.io/nitrous/docker", "Cmd" => ["/nitrous/dind", "/sbin/init", "--default-console", "none"])
    @container.start

    set :os, family: :debian
    set :backend, :docker
    set :docker_container, @container.id
  end

  after(:all) do
    @container.stop
    @container.delete
  end
end
