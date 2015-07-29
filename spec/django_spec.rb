require "serverspec"
require "docker"

describe "django" do
  before(:all) do
    @container_django = Docker::Container.create('Image' => "quay.io/nitrous/django", "Cmd" => ["/home/nitrous/code/example/start-app"])
    @container_django.start

    set :os, family: :debian
    set :backend, :docker
    set :docker_container, @container_django.id

    # Sleep 1 second to wait until start-app is running
    sleep(1)
  end

  describe port(3000) do
     it { should be_listening }
  end

  after(:all) do
    @container_django.stop
    @container_django.delete
  end
end
