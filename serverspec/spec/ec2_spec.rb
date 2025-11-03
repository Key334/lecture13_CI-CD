require 'serverspec'

set :backend, :exec

describe service('nginx') do
  it { should be_running }
end

describe service('puma') do
  it { should be_running }
end

describe port(80) do
  it { should be_listening }
end
