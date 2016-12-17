class profile::nginx {

  include ::nginx

  nginx::vhost{'test-nro.greenpeace.org':
    listen_port => '80',
    server_name => 'test-nro.greenpeace.org',
    access_log  => '/srv/test-nro/logs/access.log',
    error_log   => '/srv/test-nro/logs/error.log'
  }

}
