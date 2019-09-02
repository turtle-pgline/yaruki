# frozen_string_literal: true

package 'unzip' do
  action :install
end

execute 'download alp' do
  command 'wget "https://github.com/tkuchiki/alp/releases/download/v1.0.0/alp_linux_amd64.zip"'
  not_if 'alp --version'
end

execute 'unzip alp' do
  command 'unzip ./alp_linux_amd64.zip'
  not_if 'alp --version'
end

execute 'install alp' do
  command 'install ./alp /usr/local/bin'
  not_if 'alp --version'
end
