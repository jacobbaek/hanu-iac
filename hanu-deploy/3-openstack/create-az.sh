openstack aggregate create service
openstack aggregate create non-service
openstack aggregate set --zone service-az service
openstack aggregate set --zone non-service-az non-service
openstack aggregate add host service worker001
openstack aggregate add host service worker002
openstack aggregate add host service worker003
