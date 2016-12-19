class profile::nginx {

  include ::nginx

  nginx::resource::vhost{'test':
    ensure      => present,
    listen_port => '80 default_server',
    server_name => 'test.cloud',
    access_log  => '/srv/test-nro/logs/access.log',
    error_log   => '/srv/test-nro/logs/error.log',
    www_root    => '/srv/test-nro/html'
  }

  nginx::resource::location{'php':
    ensure             => present,
    server             => "test.cloud test",
    location           => '~ \.php$',
    try_files          => [ '$uri', '=404' ],
    fastcgi            => "unix:/var/run/php5-fpm.sock",
    fastcgi_index      => 'index.php',
    fastcgi_split_path => '^(.+\.php)(/.+)$',
    include            => 'fastcgi_params'
  }

}
