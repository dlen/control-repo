class profile::nginx {

  include ::nginx

  file{'/srv/test-nro':
    ensure => 'directory',
    mode   => '0755',
    owner  => 'wordpress',
    group  => 'wordpress';
  '/srv/test-nro/logs':
    ensure => 'directory',
    mode   => '0755',
    owner  => 'wordpress',
    group  => 'wordpress';
  }

  nginx::resource::vhost{'test':
    ensure      => present,
    listen_port => '80',
    server_name => ['test.cloud'],
    access_log  => '/srv/test-nro/logs/access.log',
    error_log   => '/srv/test-nro/logs/error.log',
    www_root    => '/srv/test-nro/html'
  }

  nginx::resource::location{'php':
    ensure             => present,
    vhost              => "test.cloud test",
    location           => '~ \.php$',
    try_files          => [ '$uri', '=404' ],
    fastcgi            => "unix:/var/run/php5-fpm.sock",
    fastcgi_split_path => '^(.+\.php)(/.+)$',
    include            => ['fastcgi_params']
  }

}
