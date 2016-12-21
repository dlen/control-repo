#
class profile::php{

	class{'::php':
		manage_repos => true,
    fpm          => true
	}

}
