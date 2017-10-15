# frozen_string_literal: true

package 'gdebi' do
  action :install
end

execute 'download percona-toolkit' do
  command 'wget https://www.percona.com/downloads/percona-toolkit/3.0.4/binary/debian/xenial/x86_64/percona-toolkit_3.0.4-1.xenial_amd64.deb'
  not_if 'pt-query-digest --version'
end

execute 'install percona-toolkit' do
  command 'yes | gdebi ./percona-toolkit_3.0.4-1.xenial_amd64.deb'
  not_if 'pt-query-digest --version'
end
