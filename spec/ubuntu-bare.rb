require "serverspec"
require "docker"

describe "Dockerfile" do
  before(:all) do
    image = Docker::Image.build_from_dir('ubuntu-bare')

    set :os, family: :debian
    set :backend, :docker
    set :docker_image, image.id
    set :docker_container_create_options, {"Cmd" => ["/sbin/init", "--default-console", "none"]}
  end

  it "installs the right version of Ubuntu" do
    expect(os_version).to include("Ubuntu 14")
  end

  describe "Nitrous User" do
    home_folder = "/home/nitrous"

    describe user('nitrous') do
      it { should exist }
      it { should belong_to_group "sudo" }
      it { should have_home_directory home_folder }
    end
  end

  describe port(22) do
     it { should be_listening }
  end

  def os_version
    command("lsb_release -a").stdout
  end
end

