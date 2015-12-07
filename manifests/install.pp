class greeter_conf::install (
  $ensure                           = $greeter_conf::ensure,
  $lightdm_package                  = $greeter_conf::lightdm_package,
  $lightdm_config_filepath          = $greeter_conf::lightdm_config_filepath,
  $default_display_manager_filepath = $greeter_conf::default_display_manager_filepath,
  $config_dirs_script_filepath      = $greeter_conf::config_dirs_script_filepath,
  $lightdm_file_path                = $greeter_conf::lightdm_file_path,
  $greeter_name                     = $greeter_conf::greeter_name,
  $user_session                     = $greeter_conf::user_session,
  $greeter_hide_users               = $greeter_conf::greeter_hide_users,
  $allow_guest                      = $greeter_conf::allow_guest,
  $background_filepath              = $greeter_conf::background_filepath,
  $greeter_show_remote_login        = $greeter_conf::greeter_show_remote_login,
  $manage_config_dirs               = $greeter_conf::manage_config_dirs,
  $config_home                      = $greeter_conf::config_home,
  $data_home                        = $greeter_conf::data_home,
  $cache_home                       = $greeter_conf::cache_home,
) {

  File {
    ensure  => $ensure,
    owner   => root,
    group   => root,
    mode    => '0644',
  }

  package{ $greeter_name:
      ensure => $ensure,
  } ->

  # Make sure lightdm is installed
  package{ $lightdm_package:
      ensure => $ensure,
  } ->

  # Configure it...
  file{ $lightdm_config_filepath:
    content => template('greeter_conf/lightdm.conf.erb'),
  } ->

  # ...and make it the default greeter.
  file{ $default_display_manager_filepath:
    content => $lightdm_file_path,
  }

  # Now make sure that dconf/gconf/other nonsense will write to a build-specific directory
  if ($manage_config_dirs) {
    file{ $config_dirs_script_filepath:
      source  => template('greeter_conf/configdirs.sh.erb'),
      require => File[$default_display_manager_filepath],
    }
  }
}
