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
) {

  File {
    ensure  => $ensure,
    owner   => root,
    group   => root,
    mode    => "644",
  }

  package{ "${greeter_package}":
      ensure => $ensure,
  } ->

  # Make sure lightdm is installed
  package{ "${lightdm_package}":
      ensure => $ensure,
  } ->

  # Configure it...
  file{ "${lightdm_config_filepath}":
    content => template('greeter_conf/lightdm.conf.erb'),
  } ->

  # ...and make it the default greeter.
  file{ "${default_display_manager_filepath}":
    content => "${lightdm_file_dir}",
  } ->

  # Now make sure that dconf/gconf/other nonsense will write to a build-specific directory
  file{ "${config_dirs_script_filepath}":
    source  => "puppet:///modules/greeter_conf/configdirs.sh",
  }

}
