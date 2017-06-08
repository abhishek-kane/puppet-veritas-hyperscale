class compute_pkg_inst {
	package { 'vrtsofcore':
		ensure   => installed,
		provider => 'rpm',
		source   => 'puppet:///modules/veritas_hyperscale/VRTSofcore-1.1.0.000-RHEL7.x86_64.rpm',
		}

	package { 'vrtsofcn':
		ensure   => installed,
		provider => 'rpm',
		source   => 'puppet:///modules/veritas_hyperscale/VRTSofcn-1.1.0.000-RHEL7.x86_64.rpm',
		}

	package { 'vrtsofspt':
		ensure   => installed,
		provider => 'rpm',
		source   => 'puppet:///modules/veritas_hyperscale/VRTSofspt_1.1.0.000-RHEL7.x86_64.rpm',
		}

	package { 'vrtsperl':
		ensure   => installed,
		provider => 'rpm',
		source   => 'puppet:///modules/veritas_hyperscale/VRTSperl-5.24.0.1-RHEL7.x86_64',
		}

	package { 'vrtsveki':
		ensure   => installed,
		provider => 'rpm',
		source   => 'puppet:///modules/veritas_hyperscale/VRTSveki-7.3.0.000-RHEL7.x86_64',
		}

	package { 'vrtsvlic':
		ensure   => installed,
		provider => 'rpm',
		source   => 'puppet:///modules/veritas_hyperscale/VRTSvlic-3.02.71.004-RHEL7.x86_64',
		}

	package { 'vrtsvxvm':
		ensure   => installed,
		provider => 'rpm',
		source   => 'puppet:///modules/veritas_hyperscale/VRTSvxvm-7.3.0.000-RHEL7.x86_64',
		}

	package { 'vrtsaslapm':
		ensure   => installed,
		provider => 'rpm',
		source   => 'puppet:///modules/veritas_hyperscale/VRTSaslapm-7.3.0.000-RHEL7.x86_64',
		}

	package { 'compute-ceilometer':
		ensure   => installed,
		provider => 'rpm',
		source   => 'puppet:///modules/veritas_hyperscale/compute-ceilometer.rpm',
		}
}
