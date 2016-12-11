class profile::base {

  include ::ssh, ::accounts, ::ntp

  create_resources('accounts::user', hiera_hash('accounts::users'))

}
