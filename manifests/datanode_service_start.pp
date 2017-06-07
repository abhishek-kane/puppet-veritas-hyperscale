class datanode_service_start {
	service { 'hyperscale-mq-dnhypervisor':
		ensure => running,
		enable => true,
		}

	service { 'hyperscale-dmld':
		ensure => running,
		enable => true,
		}

	service { 'hyperscale-bud':
		ensure => running,
		enable => true,
		}
}
