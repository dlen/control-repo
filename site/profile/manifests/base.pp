class profile::base {

  include ssh

  create_resources('accounts::user', hiera_hash('accounts::users'))

  $base_packages = [ 'vim', 'wget', 'curl', 'htop' ]

}
