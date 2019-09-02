# frozen_string_literal: true

package 'unzip' do
  action :install
end

execute 'download notify_slack' do
  command 'wget "https://github.com/catatsuy/notify_slack/releases/download/v0.4.1/notify_slack-linux-amd64.tar.gz"'
  not_if 'notify_slack --version'
end

execute 'unzip notify_slack' do
  command 'tar -xvf ./notify_slack-linux-amd64.tar.gz'
  not_if 'notify_slack --version'
end

execute 'install notify_slack' do
  command 'install ./notify_slack /usr/local/bin'
  not_if 'notify_slack --version'
end

remote_file "/etc/notify_slack.toml" do
  source "notify_slack.toml"
  mode "777"
end
