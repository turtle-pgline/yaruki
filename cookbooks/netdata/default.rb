# frozen_string_literal: true

execute 'install netdata' do
  # command 'bash<(curl -Ss https://my-netdata.io/kickstart.sh)' この行をshでやりたいができないです
  not_if 'netdata -v'
end
