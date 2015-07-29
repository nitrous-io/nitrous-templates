require "serverspec"
require "docker"

describe "discourse", tag: :nitrous do

  before(:all) do
    @container = Docker::Container.create('Image' => "quay.io/nitrous/discourse", "Cmd" => ["/sbin/init", "--default-console", "none"])
    @container.start
    set :os, family: :debian
    set :backend, :docker
    set :docker_container, @container.id
  end

  describe file("#{NitrousHelper::HOME}/code/discourse/start-app") do
    it { should exist }
    it { should be_executable }
  end

  after(:all) do
    @container.stop
    @container.delete
  end
end
