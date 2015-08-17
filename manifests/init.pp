# == Class: greeter_conf
#
# Configure the greeter using lightdm. 
#
class greeter_conf (
  $ensure                           = $greeter_conf::params::ensure,
  $lightdm_package                  = $greeter_conf::params::lightdm_package,
  $lightdm_config_filepath          = $greeter_conf::params::lightdm_config_filepath,
  $default_display_manager_filepath = $greeter_conf::params::default_display_manager_filepath,
  $config_dirs_script_filepath      = $greeter_conf::params::config_dirs_script_filepath,
  $lightdm_file_path                = $greeter_conf::params::lightdm_file_path,
  $greeter_name                     = $greeter_conf::params::greeter_name,
  $user_session                     = $greeter_conf::params::user_session,
  $greeter_hide_users               = $greeter_conf::params::greeter_hide_users,  
  $allow_guest                      = $greeter_conf::params::allow_guest,
  $background_filepath              = $greeter_conf::params::background_filepath,
  $greeter_show_remote_login        = $greeter_conf::params::greeter_show_remote_login,
) inherits greeter_conf::params {

  validate_re($ensure, '^(present|absent)$',"${ensure} is not allowed for the 'ensure' parameter. Allowed values are 'present' and 'absent'.")
  validate_re($greeter_hide_users,'^(true|false)$',"${greeter_hide_users} is not allowed for the 'greeter_hide_users' parameter. Allowed values are 'true' and 'false'.")
  validate_re($allow_guest,'^(true|false)$',"${allow_guest} is not allowed for the 'allow_guest' parameter. Allowed values are 'true' and 'false'.")
  validate_re($greeter_show_remote_login,'^(true|false)$',"${greeter_show_remote_login} is not allowed for the 'greeter_show_remote_login' parameter. Allowed values are 'true' and 'false'.")

  validate_string($lightdm_package,$lightdm_config_filepath, $default_display_manager_filepath,$config_dirs_script_filepath,$lightdm_file_path,$greeter_name,$user_session,$background_filepath)

  anchor { 'greeter_conf::begin': } ->
  class { '::greeter_conf::install': } ->
  anchor { 'greeter_conf::end': }

}
