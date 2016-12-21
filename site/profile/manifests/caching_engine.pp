#
class profile::caching_engine{

  class{ 'varnish':
    varnish_listen_port => '80',
    varnish_storage_size => '1G'
  }

  class{'varnish::vcl': }

  varnish::probe{ 'health_check': url => '/favicon.ico', interval => '3s' }

  $backends = lookup(wordpress::backends)

  $backends.each |$backend, $ip| {
    varnish::backend{ "$backend": host => "$ip", port => '80', probe => 'health_check' }
  }

  $backend_names = $backends.map |$backend| { $backend[0] }
  varnish::director{ 'wordpress_backends': backends => $backend_names }

}
