# frozen_string_literal: true

require 'unix_crypt'

name = 'root'

['zzuf', 'ryota-sakamoto', 'naari3'].each do |github|
  execute "Get Authorized keys by GitHub(#{github})" do
    action :nothing
    subscribes :run, "user[#{github}]"
    user 'root'
    cwd '/root'
    command <<-COMMANDS
      mkdir ~/.ssh
      curl -L http://github.com/#{github}.keys > ~/.ssh/authorized_keys
      chmod 700 ~/.ssh
      chmod 600 ~/.ssh/authorized_keys
    COMMANDS
  end
end
