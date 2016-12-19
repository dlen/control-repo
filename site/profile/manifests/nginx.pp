class profile::nginx {

  include ::nginx

  nginx::vhost{'test':
    listen_port => '80 default_server',
    server_name => 'test.cloud',
    access_log  => '/srv/test-nro/logs/access.log',
    error_log   => '/srv/test-nro/logs/error.log'
  }

}
