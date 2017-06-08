class datanode_pkg_inst {
	package { 'vrtsofcore':
		ensure   => installed,
		provider => 'rpm',
		source   => 'puppet:///modules/veritas_hyperscale/VRTSofcore-1.1.0.000-RHEL7.x86_64.rpm',
		}

	package { 'vrtsofdn':
		ensure   => installed,
		provider => 'rpm',
		source   => 'puppet:///modules/veritas_hyperscale/VRTSofdn-1.0.0.000-RHEL7.x86_64',
		}

	package { 'vrtsofmn':
		ensure   => installed,
		provider => 'rpm',
		source   => 'puppet:///modules/veritas_hyperscale/VRTSofmn-1.0.0.000-RHEL7.x86_64',
		require  => Package["vrtsofcore"],
		}

	package { 'vrtsofspt':
		ensure   => installed,
		provider => 'rpm',
		source   => 'puppet:///modules/veritas_hyperscale/VRTSofspt-1.0.0.000-RHEL7.x86_64',
		}

	package { 'python-amqp':
		ensure   => installed,
		provider => 'yum',
		}

	package { 'python-kombu':
		ensure   => installed,
		provider => 'yum',
		}

	package { 'python-kazoo':
		ensure   => installed,
		provider => 'yum',
		}

	package { 'python-anyjson':
		ensure   => installed,
		provider => 'yum',
		}

	package { 'python-sqlalchemy':
		ensure   => installed,
		provider => 'yum',
		}

	package { 'lvm2':
		ensure   => installed,
		provider => 'yum',
		}

	package { 'coreutils':
		ensure   => installed,
		provider => 'yum',
		}
}
