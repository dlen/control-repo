class profile::nginx {

  include ::nginx

  create_resources('nginx::resource::server', hiera_hash('nginx::vhosts'))
  create_resources('nginx::resource::location', hiera_hash('nginx::nginx_locations'))
}
