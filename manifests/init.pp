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
  $manage_config_dirs               = $greeter_conf::params::manage_config_dirs,
  $config_home                      = $greeter_conf::params::config_home,
  $data_home                        = $greeter_conf::params::data_home,
  $cache_home                       = $greeter_conf::params::cache_home,
) inherits greeter_conf::params {

  validate_re($ensure, '^(present|absent)$',"${ensure} is not allowed for the 'ensure' parameter. Allowed values are 'present' and 'absent'.")
  validate_bool($greeter_hide_users)
  validate_bool($allow_guest)
  validate_bool($greeter_show_remote_login)

  validate_string($lightdm_package)
  validate_string($lightdm_config_filepath)
  validate_string($default_display_manager_filepath)
  validate_string($config_dirs_script_filepath)
  validate_string($lightdm_file_path)
  validate_string($greeter_name)
  validate_string($user_session)
  validate_string($background_filepath)
  validate_string($config_home)
  validate_string($data_home)
  validate_string($cache_home)

  anchor { 'greeter_conf::begin': } ->
  class { '::greeter_conf::install': } ->
  anchor { 'greeter_conf::end': }

}
