require "serverspec"
require "docker"

describe "ubuntu-bare", tag: :nitrous do

  before(:all) do
    @container_ubuntu_bare = Docker::Container.create('Image' => "quay.io/nitrous/ubuntu-bare", "Cmd" => ["/sbin/init", "--default-console", "none"])
    @container_ubuntu_bare.start
    image = Docker::Image.get("quay.io/nitrous/ubuntu-bare")
    set :os, family: :debian
    set :backend, :docker
    set :docker_container, @container_ubuntu_bare.id
  end

  it "installs the right version of Ubuntu" do
    expect(os_version).to include("Ubuntu 14")
  end

  describe "Nitrous User" do
    describe user(NitrousHelper::USER) do
      it { should exist }
      it { should belong_to_group "sudo" }
      it { should have_home_directory NitrousHelper::HOME }
    end

    describe file(NitrousHelper::HOME) do
      it { should be_directory }
      it { should be_owned_by NitrousHelper::USER }
    end
  end

  describe port(22) do
     it { should be_listening }
  end

  def os_version
    command("lsb_release -a").stdout
  end

  after(:all) do
    @container_ubuntu_bare.stop
    @container_ubuntu_bare.delete
  end
end
