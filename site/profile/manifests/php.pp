#
class profile::php{

	class{'::php::globals':
		php_version => '7.0',
	  config_root => '/etc/php/7.0'
	}->

  class{'::php::repo::debian':
    release => 'jessie'
  }->

	class{'::php':
		manage_repos => true,
    fpm          => true
	}

}
