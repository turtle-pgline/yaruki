# frozen_string_literal: true

[
  'git',
  'libpng12-0',
  'libpng12-dev',
  'subversion',
  'telnet',
  'netcat',
  'iotop',
  'iftop',
  'dstat',
  'vim',
  'mlocate',
  'sysstat',
  'file',
  'lsof',
  'git',
  'mosh',
  'ngrep',
  'libmemcached-tools',
  'libmemcached-dev',
  'dnsutils',
  'strace',
  'tmux',
  'irqbalance',
  'libxml2',
  'libxml2-dev',
  'libexpat1',
  'libexpat1-dev',
  'libssl-dev',
  'g++',
  'jq',
  'unzip'
].each do |package_name|
  package package_name do
    action :install
  end
end
