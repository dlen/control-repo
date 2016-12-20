class profile::mysql{

  class{ '::mysql::server':
    root_password           => lookup(mysql::root_password),
    remove_default_accounts => true,
		override_options        => {
			'mysqld' => {
				'bind-address' => '0.0.0.0'
			}
		}
  }

  mysql::db { 'test_database':
    user     => lookup(mysql::test_username),
    password => lookup(mysql::test_password),
    host     => '%',
    grant    => ['SELECT', 'UPDATE'],
  }

}
