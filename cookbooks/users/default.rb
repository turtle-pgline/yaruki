# frozen_string_literal: true

require 'unix_crypt'

{
  # username => github name
  'yuki_sone' => 'naari3',
  `mox` => `moezakura`
}.each_pair do |name, github|
  user name do
    action :create
    password UnixCrypt::SHA512.build(name)
    shell '/bin/bash'
    create_home true
    not_if "cat /etc/passwd | grep #{name}"
  end

  execute "Get Authorized keys by GitHub(#{name})" do
    action :nothing
    subscribes :run, "user[#{name}]"
    user name
    cwd "/home/#{name}"
    command <<-COMMANDS
      mkdir ~/.ssh
      curl -L http://github.com/#{github}.keys > ~/.ssh/authorized_keys
      chmod 700 ~/.ssh
      chmod 600 ~/.ssh/authorized_keys
    COMMANDS
  end

  execute "Add sudo group(#{name})" do
    action :nothing
    subscribes :run, "user[#{name}]"
    command "usermod -G sudo #{name}"
  end
end
