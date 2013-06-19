node default {

class { 'openshift_origin' :
  
  #The DNS resolvable hostname of this host
  node_fqdn                  => "${hostname}.${domain}",

  #The domain under which application should be created. Eg: <app>-<namespace>.example.com
  cloud_domain               => 'example.com',

  #Set to `'nightlies'` to pull from latest nightly build
  #Or pass path of your locally built source `'file:///root/origin-rpms'`
  install_repo               => 'nightlies',

  #Upstream DNS server.
  dns_servers                => ['8.8.8.8'],

  enable_network_services    => true,
  configure_firewall         => true,
  configure_ntp              => true,

  #Configure the required services
  configure_activemq         => true,
  configure_mongodb          => true,
  configure_named            => true,
  configure_avahi            => false,
  configure_broker           => true,

  #Don't configure the node
  configure_node             => false,

  #Enable development mode for more verbose logs
  development_mode           => true,

  #Update the nameserver on this host to point at Bind server
  update_network_dns_servers => true,

  #Use the nsupdate broker plugin to register application
  broker_dns_plugin          => 'nsupdate',

  #If installing from a local build, specify the path for Origin RPMs
  #install_repo               => 'file:///root/origin-rpms',

  #If using BIND, let the broker know what TSIG key to use
  named_tsig_priv_key         => "${tsig_key}"
  }

}