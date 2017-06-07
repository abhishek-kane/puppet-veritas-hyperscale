class compute_service_start {
	service { 'hyperscale-mq-hypervisor':
		ensure => running,
		enable => true,
		}

	service { 'hyperscale-mq-storage':
		ensure => running,
		enable => true,
		}

	service { 'hyperscale-ceilometer':
		ensure => running,
		enable => true,
		}
}
