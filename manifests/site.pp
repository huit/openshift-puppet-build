node default {

  class { 'openshift_origin' :
    node_fqdn                  => "${hostname}.${domain}",
    cloud_domain               => 'openshift.local',
    dns_servers                => ['8.8.8.8'],
    os_unmanaged_users         => [],
    enable_network_services    => true,
    configure_firewall         => true,
    configure_ntp              => true,
    configure_activemq         => true,
    configure_mongodb          => true,
    configure_named            => false,
    configure_avahi            => true,
    configure_broker           => true,
    configure_node             => true,
    development_mode           => true,
    update_network_dns_servers => false,
    avahi_ipaddress            => '127.0.0.1',
    broker_dns_plugin          => 'avahi',
  }

}