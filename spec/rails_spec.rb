require "serverspec"
require "docker"

describe "rails", tag: :nitrous do
  before(:all) do
    @container_rails = Docker::Container.create('Image' => "quay.io/nitrous/rails", "Cmd" => ["/sbin/init", "--default-console", "none"])
    @container_rails.start
    set :os, family: :debian
    set :backend, :docker
    set :docker_container, @container_rails.id

    sleep(2)
  end

  describe package('postgresql-9.4') do
    it { should be_installed.with_version('9.4.4-1.pgdg14.04+1') }
  end

  after(:all) do
    @container_rails.stop
    @container_rails.delete
  end
end
