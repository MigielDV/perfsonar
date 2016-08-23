#!/bin/bash
echo "Merge NetherLight testing files..."
echo -e "$(cat /root/regulartesting.conf)\n$(cat /etc/perfsonar/regulartesting.conf)" > /etc/perfsonar/regulartesting.conf
echo "Starting OWAMP..."
/etc/init.d/owamp-server start
echo "Starting BWCTL..."
/etc/init.d/bwctl-server start
echo "Starting LS REGISTRATION DAEMON..."
/etc/init.d/perfsonar-lsregistrationdaemon start
echo "Starting HTTPD..."
/etc/init.d/httpd start
echo "Starting POSTGRESQL..."
/etc/init.d/postgresql start
echo "Starting CASSANDRA..."
/etc/init.d/cassandra start
echo "Starting REGULARTESTING..."
/etc/init.d/perfsonar-regulartesting start
echo "Starting NDT..."
/etc/init.d/ndt start
echo "Starting CONFIGDAEMON..."
/etc/init.d/perfsonar-configdaemon start
echo "Starting NIC PARAMETERS..."
/etc/init.d/perfsonar-configure_nic_parameters start
echo "Starting OPPD..."
/etc/init.d/perfsonar-oppd-server start
echo "start.sh Finished!"
