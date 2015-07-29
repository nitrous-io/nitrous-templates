require "serverspec"
require "docker"

describe "ruby" do
  before(:all) do
    @container_ruby = Docker::Container.create('Image' => "quay.io/nitrous/ruby", "Cmd" => ["/sbin/init", "--default-console", "none"])
    @container_ruby.start

    set :os, family: :debian
    set :backend, :docker
    set :docker_container, @container_ruby.id
  end

  describe command('su --login nitrous -c "ruby --version"') do
    its(:stdout) { should match /ruby 2.1.5p/}
  end

  after(:all) do
    @container_ruby.stop
    @container_ruby.delete
  end
end
