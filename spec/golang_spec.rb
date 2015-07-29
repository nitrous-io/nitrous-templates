require "serverspec"
require "docker"

describe "golang" do
  before(:all) do
    @container_golang = Docker::Container.create('Image' => "quay.io/nitrous/golang", "Cmd" => ["/sbin/init", "--default-console", "none"])
    @container_golang.start

    set :os, family: :debian
    set :backend, :docker
    set :docker_container, @container_golang.id
  end

  describe command('su --login nitrous -c "go version"') do
    its(:stdout) { should match /go version go1\.4\.2/}
  end

  after(:all) do
    @container_golang.stop
    @container_golang.delete
  end
end
