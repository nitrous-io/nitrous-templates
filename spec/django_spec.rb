require "serverspec"
require "docker"

describe "django" do
  before(:all) do
#     image = Docker::Image.get("quay.io/nitrous/django")
    @container_django = Docker::Container.create('Image' => "quay.io/nitrous/django", "Cmd" => ["/home/nitrous/code/example/start-app"])
    @container_django.start

    set :os, family: :debian
    set :backend, :docker
    set :docker_container, @container_django.id
#     set :docker_container_create_options, {"Cmd" => ["/home/nitrous/code/example/start-app"]}

    # Sleep 1 second to wait until start-app is running
    sleep(1)
  end

  it "installs the right version of Ubuntu" do
    expect(os_version).to include("Ubuntu 14")
  end

  describe package('git') do
    it { should be_installed }
  end

  describe port(3000) do
     it { should be_listening }
  end

  def os_version
    command("lsb_release -a").stdout
  end

  after(:all) do
    @container_django.stop
    @container_django.delete
  end
end
