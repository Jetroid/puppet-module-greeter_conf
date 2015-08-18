# Default parameters
class greeter_conf::params {

  $ensure                           = 'present'
  $lightdm_package                  = 'lightdm'
  $lightdm_config_filepath          = '/etc/lightdm/lightdm.conf'  
  $default_display_manager_filepath = '/etc/X11/default-display-manager'
  $config_dirs_script_filepath      = '/etc/profile.d/config-dirs.sh'
  $lightdm_file_path                = '/usr/sbin/lightdm'
# lightdm.conf params.
  $greeter_name                     = 'unity-greeter'
  $user_session                     = 'ubuntu'
  $greeter_hide_users               = 'true'
  $allow_guest                      = 'false'
  $background_filepath              = '/usr/share/backgrounds/warty-final-ubuntu.png'
  $greeter_show_remote_login        = 'false'
  $draw_grid                        = 'false'
}
