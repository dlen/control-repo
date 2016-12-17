class profile::nginx {

  include ::nginx

  nginx::vhost{'test-nro.greenpeace.org':
    listen_port => '80',
    server_name => 'test-nro.greenpeace.org',
    access_log  => '/srv/test-nro/logs/access.log',
    error_log   => '/srv/test-nro/logs/error.log'
  }

  nginx::location{'/':
    server             => 'test-nro.greenpeace.org',
    try_files          => [ '$uri', '$uri/', '/index.php?q=uri&$args' ];
  '~\.php$':
    server             => 'test-nro.greenpeace.org',
    try_files          => [ '$uri', '=404' ],
    fastcgi_split_path => '^(.+\.php)(/.+)$',
    fastcgi_pass       => 'unix:/var/run/php5-fpm.sock',
    fastcgi_index      => 'index.php',
    include            => 'fastcgi_params'
  }

}
