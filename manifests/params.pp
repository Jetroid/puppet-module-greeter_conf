# Default parameters
class greeter_conf::params {

  # Configuration paths
  $ensure                           = 'present'
  $lightdm_package                  = 'lightdm'
  $lightdm_config_filepath          = '/etc/lightdm/lightdm.conf'
  $default_display_manager_filepath = '/etc/X11/default-display-manager'
  $config_dirs_script_filepath      = '/etc/profile.d/config-dirs.sh'
  $lightdm_file_path                = '/usr/sbin/lightdm'

  # lightdm.conf options
  $greeter_name                     = 'unity-greeter'
  $user_session                     = 'ubuntu'
  $greeter_hide_users               = true
  $allow_guest                      = false
  $background_filepath              = '/usr/share/backgrounds/warty-final-ubuntu.png'
  $greeter_show_remote_login        = false

  # Options for changing default config/cache dirs
  $manage_config_dirs               = false
  $config_home                      = '$HOME/.config'
  $data_home                        = '$HOME/.local'
  $cache_home                       = '$HOME/.cache'
}
