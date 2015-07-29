require "serverspec"
require "docker"

describe "ubuntu" do
  before(:all) do
    @container = Docker::Container.create('Image' => "quay.io/nitrous/ubuntu", "Cmd" => ["/sbin/init", "--default-console", "none"])
    @container.start

    set :os, family: :debian
    set :backend, :docker
    set :docker_container, @container.id
  end

  %w(.gitconfig .tmux.conf .zshrc .hushlogin).each do |f|
    describe file("#{NitrousHelper::HOME}/#{f}") do
      it { should exist }
      it { should be_owned_by NitrousHelper::USER }
    end
  end

  describe user(NitrousHelper::USER) do
    it { should have_login_shell "/bin/zsh" }
  end

  after(:all) do
    @container.stop
    @container.delete
  end
end
