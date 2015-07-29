require "serverspec"
require "docker"

describe "nodejs" do
  before(:all) do
#     image = Docker::Image.get("quay.io/nitrous/django")
    @container_nodejs = Docker::Container.create('Image' => "quay.io/nitrous/nodejs", "Cmd" => ["/sbin/init", "--default-console", "none"])
    @container_nodejs.start

    set :os, family: :debian
    set :backend, :docker
    set :docker_container, @container_nodejs.id
  end

  describe command('su --login nitrous -c "node -v"') do
    its(:stdout) { should match /0\.12\.5/}
  end

  describe command('su --login nitrous -c "heroku --version"') do
    its(:stdout) { should match /heroku-toolbelt/ }
  end

  after(:all) do
    @container_nodejs.stop
    @container_nodejs.delete
  end
end
