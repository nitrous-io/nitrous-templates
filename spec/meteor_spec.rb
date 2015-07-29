require "serverspec"
require "docker"

describe "meteor", tag: :nitrous do

  before(:all) do
    @container_meteor = Docker::Container.create('Image' => "quay.io/nitrous/meteor", "Cmd" => ["/home/nitrous/code/example/start-app"])
    @container_meteor.start
    set :os, family: :debian
    set :backend, :docker
    set :docker_container, @container_meteor.id

    sleep(2)
  end

  describe port(3000) do
    it { should be_listening }
  end

  after(:all) do
    @container_meteor.stop
    @container_meteor.delete
  end
end
