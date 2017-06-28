SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `HyperScale`
--

USE `HyperScale`;

INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.compute.cache.ssdthres', 'SSD usage on %(SOURCE)s high');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.cloud.cache.ssdthres', 'SSD usage on %(ASSOC)s high');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.compute.cache.ssdthresl2', 'SSD usage on %(SOURCE)s reached 70 percent');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.cloud.cache.ssdthresl2', 'SSD usage on %(ASSOC)s reached 70 percent');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.vdisk.dal.ioerror', 'I/O error on vdisk %(SOURCE)s');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.vm.dal.ioerror', 'I/O error on vdisk %(ASSOC)s in VM %(SOURCE)s');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.compute.dal.ioerror', 'I/O error on VM %(ASSOC)s in compute %(SOURCE)s');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.cloud.dal.ioerror', 'I/O error on compute %(ASSOC)s');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.dn.poolutil.exceeded', '%(SOURCE)s is using more than 90 percent of its storage');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.cloud.poolutil.exceeded', '%(ASSOC)s is using more than 90 percent of its storage');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.vdisk.eds.failed', 'Snapshot creation failed for vdisk %(SOURCE)s due to network connection failure');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.vm.eds.failed', 'Snapshot creation failed for vdisk %(ASSOC)s in VM %(SOURCE)s due to network connection failure');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.compute.eds.failed', 'Snapshot creation failed for VM %(ASSOC)s in compute %(SOURCE)s due to network connection failure');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.cloud.eds.failed', 'Snapshot creation failed for compute %(ASSOC)s due to network connection failure');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.cloud.dnsl.ioerror', 'I/O error on datanode %(ASSOC)s');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.dn.dnsl.ioerror', 'I/O error on datanode %(SOURCE)s');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.vm.dnrt.failed', 'Datanode reflection failure for vdisk %(ASSOC)s in VM %(SOURCE)s');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.vdisk.dnrt.failed', 'Datanode reflection failure for vdisk %(ASSOC)s');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.vdisk.dnrs.failed', 'Datanode reflection failure for vdisk %(ASSOC)s');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.dn.service.down', 'Datanode %(SOURCE)s service is down');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.vm.degraded.dn.sla', 'VM %(SOURCE)s is not able to meet resiliency SLAs for snapshots due to datanode failure');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.vdisk.qos.miniops', 'Cannot serve miniops for vdisk %(SOURCE)s');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.vm.qos.miniops', 'Cannot serve miniops for vdisk %(ASSOC)s in VM %(SOURCE)s');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.compute.qos.miniops', 'Cannot serve miniops for VM %(ASSOC)s in compute %(SOURCE)s');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.cloud.qos.miniops', 'Cannot serve miniops for compute %(ASSOC)s');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.vm.cnrt.failed', 'Storage Redundancy SLA is violated for an Instance "%(SOURCE)s". Refer to hyperscale cli option to get the current status of storage redundancy level');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.cloud.dn.down', 'Datanode %(ASSOC)s service is down');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.compute.ssd.failed', 'SSD I/O error on %(SOURCE)s. Use vxdisk list command to know the failed SSDs. Please live migrate any existing instances from this compute');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.cloud.ssd.failed', 'SSD I/O error on %(ASSOC)s. Use vxdisk list command to know the failed SSDs. Please live migrate any existing instances from this compute');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.compute.hdd.failed', 'I/O error occurred on vdisk associated with compute %(SOURCE)s. Use vxdisk list command to know the failed HDDs. Please live migrate any existing instances from this compute');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.cloud.hdd.failed', 'I/O error occurred on vdisk associated with compute %(ASSOC)s. Use vxdisk list command to know the failed HDDs. Please live migrate any existing instances from this compute');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.vm.dnror.failed', 'Failed to restore Datanode resiliency for vdisk %(ASSOC)s');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.vm.failed', ' VM %(SOURCE)s has failed due to storage deamon restart');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.compute.vm.failed', ' VM %(ASSOC)s has failed due to storage deamon restart on %(SOURCE)s');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.cloud.vm.failed', ' VM has failed on compute %(ASSOC)s due to storage deamon restart');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.compute.service.down', 'Compute %(SOURCE)s service is down');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.cloud.compute.down', 'Compute %(ASSOC)s service is down');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.vdisk.snapshot.failed', 'Episodic snapshot creation failed for tenant %(TENANT)s and vdisk %(SOURCE)s. Please ensure that there are no quota restrictions for creating snapshots');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.vm.snapshot.failed', 'Episodic snapshot creation failed for tenant %(TENANT)s and Instance %(SOURCE)s for vdisk %(ASSOC)s. Please ensure that there are no quota restrictions for creating snapshots');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.compute.snapshot.failed', 'Episodic snapshot creation failed for tenant %(TENANT)s and compute %(SOURCE)s for Instance %(ASSOC)s. Please ensure that there are no quota restrictions for creating snapshots');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.vdisk.ssf.failed', 'SSF workflow failed for vdisk %(SOURCE)s');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.vdisk.smf.failed', 'SMF workflow failed for vdisk %(SOURCE)s');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.vdisk.ror.failed', 'RoR workflow failed for vdisk %(SOURCE)s');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.vdisk.bst.failed', 'BST hydrate workflow failed for vdisk %(SOURCE)s');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.vm.ssf.failed', 'SSF workflow failed for vdisk %(ASSOC)s associated with instance %(SOURCE)s');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.vm.smf.failed', 'SMF workflow failed for vdisk %(ASSOC)s associated with instance %(SOURCE)s');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.vm.ror.failed', 'RoR workflow failed for vdisk %(ASSOC)s associated with instance %(SOURCE)s');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.vm.bst.failed', 'BST hydrate workflow failed for vdisk %(ASSOC)s associated with instance %(SOURCE)s');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.compute.disk.removed', 'Disk %(ASSOC)s from Compute %(SOURCE)s is removed. Please live migrate any existing instances from this Compute and perform Disable and Enable operations to re-use this compute');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.cloud.disk.removed', 'Disk from Compute %(ASSOC)s is removed. Please live migrate any existing instances from this Compute and perform Disable and Enable operations to re-use this compute');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.cloud.bst.succeeded', 'Live migrate all instances from compute %(ASSOC)s since storage daemon failed to come up');
INSERT INTO `hyperscale_alerts_description` (
      `topic`, `alert_text`) VALUES (
      'alert.compute.bst.succeeded', 'Live migrate instance %(ASSOC)s from compute %(SOURCE)s since storage daemon failed to come up');
