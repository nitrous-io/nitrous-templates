require "serverspec"
require "docker"

describe "laravel", tag: :nitrous do

  before(:all) do
    @container_laravel = Docker::Container.create('Image' => "quay.io/nitrous/laravel","Cmd" => ["/home/nitrous/code/example/start-app"])
    @container_laravel.start
    set :os, family: :debian
    set :backend, :docker
    set :docker_container, @container_laravel.id

    sleep(2)
  end

  describe port(3000) do
    it { should be_listening }
  end

  after(:all) do
    @container_laravel.stop
    @container_laravel.delete
  end
end
