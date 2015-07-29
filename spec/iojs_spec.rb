require "serverspec"
require "docker"

describe "iojs" do
  before(:all) do
    @container_iojs = Docker::Container.create('Image' => "quay.io/nitrous/iojs", "Cmd" => ["/sbin/init", "--default-console", "none"])
    @container_iojs.start

    set :os, family: :debian
    set :backend, :docker
    set :docker_container, @container_iojs.id
  end

  describe command('su --login nitrous -c "iojs -v"') do
    its(:stdout) { should match /v2\.3\.1/}
  end

  describe command('su --login nitrous -c "heroku --version"') do
    its(:stdout) { should match /heroku-toolbelt/ }
  end

  after(:all) do
    @container_iojs.stop
    @container_iojs.delete
  end
end
