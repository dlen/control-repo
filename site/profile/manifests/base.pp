class profile::base {

  include ssh, accounts, ntp, sudo

  create_resources('accounts::user', hiera_hash('accounts::users'))

}
