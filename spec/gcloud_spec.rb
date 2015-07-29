require "serverspec"
require "docker"

describe "gcloud", tag: :nitrous do

  before(:all) do
    @container = Docker::Container.create('Image' => "quay.io/nitrous/gcloud", "Cmd" => ["/sbin/init", "--default-console", "none"])
    @container.start
    set :os, family: :debian
    set :backend, :docker
    set :docker_container, @container.id
  end

  describe command("su -l #{NitrousHelper::USER} -c \"#{NitrousHelper::HOME}/google-cloud-sdk/bin/gcloud -v\"") do
    its(:stdout) { should match /Google Cloud SDK 0.9.70/ }
  end

  after(:all) do
    @container.stop
    @container.delete
  end
end
