require "serverspec"
require "docker"

describe "rust" do
  before(:all) do
    @container_rust = Docker::Container.create('Image' => "quay.io/nitrous/rust", "Cmd" => ["/sbin/init", "--default-console", "none"])
    @container_rust.start

    set :os, family: :debian
    set :backend, :docker
    set :docker_container, @container_rust.id
  end

  describe command('su -l nitrous -c "rustc -V"') do
    its(:stdout) { should match /rustc 1.1.0/}
  end

  after(:all) do
    @container_rust.stop
    @container_rust.delete
  end
end
