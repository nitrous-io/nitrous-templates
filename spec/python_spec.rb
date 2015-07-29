require "serverspec"
require "docker"

describe "python" do
  before(:all) do
    @container_python = Docker::Container.create('Image' => "quay.io/nitrous/python", "Cmd" => ["/sbin/init", "--default-console", "none"])
    @container_python.start

    set :os, family: :debian
    set :backend, :docker
    set :docker_container, @container_python.id
  end

  describe command('python --version') do
    its(:stderr) { should match /Python 2.7.6/}
  end

  after(:all) do
    @container_python.stop
    @container_python.delete
  end
end
