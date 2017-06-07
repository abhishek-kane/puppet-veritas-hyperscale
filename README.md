# hyperscale

## Overview

Install the Veritas HyperScale bin on the OpenStack controller.

## Setup

### What hyperscale affects

* A list of files, packages, services, or operations that the module will alter,
  impact, or execute on the system it's installed on.
* This is a great place to stick any warnings.
* Can be in list or paragraph form.

### Setup Requirements

Tested with puppet version 3.8.5.
The bin installation works only on the OpenStack controller.
Create '/etc/puppet/modules/veritas_hyperscale/files' directory and copy the downloaded bin to this directory.

## Usage

node 'node1@my.nodes.com' {
        class {'hyperscale':
                bin_name => "HyperScale_release.ubuntu.bin",
                management_ip => "172.101.101.1",
                openstack_admin_passwd => "adminpasswd",
                mysql_root_passwd => "mysqlpasswd",
                operation => "install",
        }
}


## Limitations

TODO: Uninstall

## Reference

More about the product-
https://www.veritas.com/product/software-defined-storage/hyperscale-for-openstack
