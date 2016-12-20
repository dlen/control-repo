#
class profile::caching_engine{

  class{ 'varnish':
    varnish_listen_port => '80',
    varnish_storage_size => '1G'
  }

  class{'varnish::vcl': }
    varnish::probe{ '

}
