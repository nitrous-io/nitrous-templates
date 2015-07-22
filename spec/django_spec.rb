require "serverspec"
require "docker"

describe "Dockerfile" do
  before(:all) do
    image = Docker::Image.build_from_dir('django')

    set :os, family: :debian
    set :backend, :docker
    set :docker_image, image.id
    set :docker_container_create_options, {"Cmd" => ["/home/nitrous/code/example/start-app"]}
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
end
