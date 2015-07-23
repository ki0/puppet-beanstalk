# = Class: beanstalkd
#
# This is the main beanstalkd class
#
#
# == Parameters
#
# Standard class parameters
# Define the general class behaviour and customizations
#
# [*my_class*]
#   Name of a custom class to autoload to manage module's customizations
#   If defined, beanstalkd class will automatically "include $my_class"
#   Can be defined also by the (top scope) variable $beanstalkd_myclass
#
# [*source*]
#   Sets the content of source parameter for main configuration file
#   If defined, beanstalkd main config file will have the param: source => $source
#   Can be defined also by the (top scope) variable $beanstalkd_source
#
# [*template*]
#   Sets the path to the template to use as content for main configuration file
#   If defined, beanstalkd main config file has: content => content("$template")
#   Note source and template parameters are mutually exclusive: don't use both
#   Can be defined also by the (top scope) variable $beanstalkd_template
#
# [*options*]
#   An hash of custom options to be used in templates for arbitrary settings.
#   Can be defined also by the (top scope) variable $beanstalkd_options
#
# [*service_autorestart*]
#   Automatically restarts the beanstalkd service when there is a change in
#   configuration files. Default: true, Set to false if you don't want to
#   automatically restart the service.
#
# [*version*]
#   The package version, used in the ensure parameter of package type.
#   Default: present. Can be 'latest' or a specific version number.
#   Note that if the argument absent (see below) is set to true, the
#   package is removed, whatever the value of version parameter.
#
# [*absent*]
#   Set to 'true' to remove package(s) installed by module
#   Can be defined also by the (top scope) variable $beanstalkd_absent
#
# [*disable*]
#   Set to 'true' to disable service(s) managed by module
#   Can be defined also by the (top scope) variable $beanstalkd_disable
#
# [*disableboot*]
#   Set to 'true' to disable service(s) at boot, without checks if it's running
#   Use this when the service is managed by a tool like a cluster software
#   Can be defined also by the (top scope) variable $beanstalkd_disableboot
#
# [*monitor*]
#   Set to 'true' to enable monitoring of the services provided by the module
#   Can be defined also by the (top scope) variables $beanstalkd_monitor
#   and $monitor
#
# [*monitor_tool*]
#   Define which monitor tools (ad defined in Example42 monitor module)
#   you want to use for beanstalkd checks
#   Can be defined also by the (top scope) variables $beanstalkd_monitor_tool
#   and $monitor_tool
#
# [*monitor_target*]
#   The Ip address or hostname to use as a target for monitoring tools.
#   Default is the fact $ipaddress
#   Can be defined also by the (top scope) variables $beanstalkd_monitor_target
#   and $monitor_target
#
# [*puppi*]
#   Set to 'true' to enable creation of module data files that are used by puppi
#   Can be defined also by the (top scope) variables $beanstalkd_puppi and $puppi
#
# [*puppi_helper*]
#   Specify the helper to use for puppi commands. The default for this module
#   is specified in params.pp and is generally a good choice.
#   You can customize the output of puppi commands for this module using another
#   puppi helper. Use the define puppi::helper to create a new custom helper
#   Can be defined also by the (top scope) variables $beanstalkd_puppi_helper
#   and $puppi_helper
#
# [*firewall*]
#   Set to 'true' to enable firewalling of the services provided by the module
#   Can be defined also by the (top scope) variables $beanstalkd_firewall
#   and $firewall
#
# [*firewall_tool*]
#   Define which firewall tool(s) (ad defined in Example42 firewall module)
#   you want to use to open firewall for beanstalkd port(s)
#   Can be defined also by the (top scope) variables $beanstalkd_firewall_tool
#   and $firewall_tool
#
# [*firewall_src*]
#   Define which source ip/net allow for firewalling beanstalkd. Default: 0.0.0.0/0
#   Can be defined also by the (top scope) variables $beanstalkd_firewall_src
#   and $firewall_src
#
# [*firewall_dst*]
#   Define which destination ip to use for firewalling. Default: $ipaddress
#   Can be defined also by the (top scope) variables $beanstalkd_firewall_dst
#   and $firewall_dst
#
# [*debug*]
#   Set to 'true' to enable modules debugging
#   Can be defined also by the (top scope) variables $beanstalkd_debug and $debug
#
# [*audit_only*]
#   Set to 'true' if you don't intend to override existing configuration files
#   and want to audit the difference between existing files and the ones
#   managed by Puppet.
#   Can be defined also by the (top scope) variables $beanstalkd_audit_only
#   and $audit_only
#
# [*noops*]
#   Set noop metaparameter to true for all the resources managed by the module.
#   Basically you can run a dryrun for this specific module if you set
#   this to true. Default: false
#
# Default class params - As defined in beanstalkd::params.
# Note that these variables are mostly defined and used in the module itself,
# overriding the default values might not affected all the involved components.
# Set and override them only if you know what you're doing.
# Note also that you can't override/set them via top scope variables.
#
# [*package*]
#   The name of beanstalkd package
#
# [*service*]
#   The name of beanstalkd service
#
# [*service_status*]
#   If the beanstalkd service init script supports status argument
#
# [*process*]
#   The name of beanstalkd process
#
# [*process_args*]
#   The name of beanstalkd arguments. Used by puppi and monitor.
#   Used only in case the beanstalkd process name is generic (java, ruby...)
#
# [*process_user*]
#   The name of the user beanstalkd runs with. Used by puppi and monitor.
#
# [*config_file*]
#   Main configuration file path
#
# [*config_file_mode*]
#   Main configuration file path mode
#
# [*config_file_owner*]
#   Main configuration file path owner
#
# [*config_file_group*]
#   Main configuration file path group
#
# [*config_file_init*]
#   Path of configuration file sourced by init script
#
# [*pid_file*]
#   Path of pid file. Used by monitor
#
# [*data_dir*]
#   Path of application data directory. Used by puppi
#
# [*log_dir*]
#   Base logs directory. Used by puppi
#
# [*log_file*]
#   Log file(s). Used by puppi
#
# [*port*]
#   The listening port, if any, of the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Note: This doesn't necessarily affect the service configuration file
#   Can be defined also by the (top scope) variable $beanstalkd_port
#
# [*protocol*]
#   The protocol used by the the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Can be defined also by the (top scope) variable $beanstalkd_protocol
#
#
# See README for usage patterns.
#
class beanstalkd (
  $my_class            = params_lookup( 'my_class' ),
  $source              = params_lookup( 'source' ),
  $template            = params_lookup( 'template' ),
  $service_autorestart = params_lookup( 'service_autorestart' , 'global' ),
  $options             = params_lookup( 'options' ),
  $version             = params_lookup( 'version' ),
  $absent              = params_lookup( 'absent' ),
  $disable             = params_lookup( 'disable' ),
  $disableboot         = params_lookup( 'disableboot' ),
  $monitor             = params_lookup( 'monitor' , 'global' ),
  $monitor_tool        = params_lookup( 'monitor_tool' , 'global' ),
  $monitor_target      = params_lookup( 'monitor_target' , 'global' ),
  $puppi               = params_lookup( 'puppi' , 'global' ),
  $puppi_helper        = params_lookup( 'puppi_helper' , 'global' ),
  $firewall            = params_lookup( 'firewall' , 'global' ),
  $firewall_tool       = params_lookup( 'firewall_tool' , 'global' ),
  $firewall_src        = params_lookup( 'firewall_src' , 'global' ),
  $firewall_dst        = params_lookup( 'firewall_dst' , 'global' ),
  $debug               = params_lookup( 'debug' , 'global' ),
  $audit_only          = params_lookup( 'audit_only' , 'global' ),
  $noops               = params_lookup( 'noops' ),
  $package             = params_lookup( 'package' ),
  $service             = params_lookup( 'service' ),
  $service_status      = params_lookup( 'service_status' ),
  $process             = params_lookup( 'process' ),
  $process_args        = params_lookup( 'process_args' ),
  $process_user        = params_lookup( 'process_user' ),
  $config_file         = params_lookup( 'config_file' ),
  $config_file_mode    = params_lookup( 'config_file_mode' ),
  $config_file_owner   = params_lookup( 'config_file_owner' ),
  $config_file_group   = params_lookup( 'config_file_group' ),
  $config_file_init    = params_lookup( 'config_file_init' ),
  $pid_file            = params_lookup( 'pid_file' ),
  $data_dir            = params_lookup( 'data_dir' ),
  $log_dir             = params_lookup( 'log_dir' ),
  $log_file            = params_lookup( 'log_file' ),
  $port                = params_lookup( 'port' ),
  $protocol            = params_lookup( 'protocol' )
  ) inherits beanstalkd::params {

  $bool_service_autorestart=any2bool($service_autorestart)
  $bool_absent=any2bool($absent)
  $bool_disable=any2bool($disable)
  $bool_disableboot=any2bool($disableboot)
  $bool_monitor=any2bool($monitor)
  $bool_puppi=any2bool($puppi)
  $bool_firewall=any2bool($firewall)
  $bool_debug=any2bool($debug)
  $bool_audit_only=any2bool($audit_only)
  $bool_noops=any2bool($noops)

  ### Definition of some variables used in the module
  $manage_package = $beanstalkd::bool_absent ? {
    true  => 'absent',
    false => $beanstalkd::version,
  }

  $manage_service_enable = $beanstalkd::bool_disableboot ? {
    true    => false,
    default => $beanstalkd::bool_disable ? {
      true    => false,
      default => $beanstalkd::bool_absent ? {
        true  => false,
        false => true,
      },
    },
  }

  $manage_service_ensure = $beanstalkd::bool_disable ? {
    true    => 'stopped',
    default =>  $beanstalkd::bool_absent ? {
      true    => 'stopped',
      default => 'running',
    },
  }

  $manage_service_autorestart = $beanstalkd::bool_service_autorestart ? {
    true    => Service[beanstalkd],
    false   => undef,
  }

  $manage_file = $beanstalkd::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }

  if $beanstalkd::bool_absent == true
  or $beanstalkd::bool_disable == true
  or $beanstalkd::bool_disableboot == true {
    $manage_monitor = false
  } else {
    $manage_monitor = true
  }

  if $beanstalkd::bool_absent == true
  or $beanstalkd::bool_disable == true {
    $manage_firewall = false
  } else {
    $manage_firewall = true
  }

  $manage_audit = $beanstalkd::bool_audit_only ? {
    true  => 'all',
    false => undef,
  }

  $manage_file_replace = $beanstalkd::bool_audit_only ? {
    true  => false,
    false => true,
  }

  $manage_file_source = $beanstalkd::source ? {
    ''        => undef,
    default   => $beanstalkd::source,
  }

  $manage_file_content = $beanstalkd::template ? {
    ''        => undef,
    default   => template($beanstalkd::template),
  }

  ### Managed resources
  package { $beanstalkd::package:
    ensure  => $beanstalkd::manage_package,
    noop    => $beanstalkd::bool_noops,
  }

  service { 'beanstalkd':
    ensure     => $beanstalkd::manage_service_ensure,
    name       => $beanstalkd::service,
    enable     => $beanstalkd::manage_service_enable,
    hasstatus  => $beanstalkd::service_status,
    pattern    => $beanstalkd::process,
    require    => Package[$beanstalkd::package],
    noop       => $beanstalkd::bool_noops,
  }

  file { 'beanstalkd.conf':
    ensure  => $beanstalkd::manage_file,
    path    => $beanstalkd::config_file,
    mode    => $beanstalkd::config_file_mode,
    owner   => $beanstalkd::config_file_owner,
    group   => $beanstalkd::config_file_group,
    require => Package[$beanstalkd::package],
    notify  => $beanstalkd::manage_service_autorestart,
    source  => $beanstalkd::manage_file_source,
    content => $beanstalkd::manage_file_content,
    replace => $beanstalkd::manage_file_replace,
    audit   => $beanstalkd::manage_audit,
    noop    => $beanstalkd::bool_noops,
  }

  ### Include custom class if $my_class is set
  if $beanstalkd::my_class {
    include $beanstalkd::my_class
  }


  ### Provide puppi data, if enabled ( puppi => true )
  if $beanstalkd::bool_puppi == true {
    $classvars=get_class_args()
    puppi::ze { 'beanstalkd':
      ensure    => $beanstalkd::manage_file,
      variables => $classvars,
      helper    => $beanstalkd::puppi_helper,
      noop      => $beanstalkd::bool_noops,
    }
  }


  ### Service monitoring, if enabled ( monitor => true )
  if $beanstalkd::bool_monitor == true {
    if $beanstalkd::port != '' {
      monitor::port { "beanstalkd_${beanstalkd::protocol}_${beanstalkd::port}":
        protocol => $beanstalkd::protocol,
        port     => $beanstalkd::port,
        target   => $beanstalkd::monitor_target,
        tool     => $beanstalkd::monitor_tool,
        enable   => $beanstalkd::manage_monitor,
        noop     => $beanstalkd::bool_noops,
      }
    }
    if $beanstalkd::service != '' {
      monitor::process { 'beanstalkd_process':
        process  => $beanstalkd::process,
        service  => $beanstalkd::service,
        pidfile  => $beanstalkd::pid_file,
        user     => $beanstalkd::process_user,
        argument => $beanstalkd::process_args,
        tool     => $beanstalkd::monitor_tool,
        enable   => $beanstalkd::manage_monitor,
        noop     => $beanstalkd::bool_noops,
      }
    }
  }


  ### Firewall management, if enabled ( firewall => true )
  if $beanstalkd::bool_firewall == true and $beanstalkd::port != '' {
    firewall { "beanstalkd_${beanstalkd::protocol}_${beanstalkd::port}":
      source      => $beanstalkd::firewall_src,
      destination => $beanstalkd::firewall_dst,
      protocol    => $beanstalkd::protocol,
      port        => $beanstalkd::port,
      action      => 'allow',
      direction   => 'input',
      tool        => $beanstalkd::firewall_tool,
      enable      => $beanstalkd::manage_firewall,
      noop        => $beanstalkd::bool_noops,
    }
  }


  ### Debugging, if enabled ( debug => true )
  if $beanstalkd::bool_debug == true {
    file { 'debug_beanstalkd':
      ensure  => $beanstalkd::manage_file,
      path    => "${settings::vardir}/debug-beanstalkd",
      mode    => '0640',
      owner   => 'root',
      group   => 'root',
      content => inline_template('<%= scope.to_hash.reject { |k,v| k.to_s =~ /(uptime.*|path|timestamp|free|.*password.*|.*psk.*|.*key)/ }.to_yaml %>'),
      noop    => $beanstalkd::bool_noops,
    }
  }

  ### More than one instance of server
  if $beanstalkd::instance {
     create_resource(beanstalkd::instance, $instance)
  }

}
