class wordpress::defaults {
  $base_dir     = '/var/www'
  $config_dir   = '/var/www'
  $content_dir  = "${base_dir}/wp-content"
  $plugins_dir  = "${content_dir}/plugins"
  $themes_dir   = "${content_dir}/themes"
  $uploads_dir  = "${content_dir}/uploads"

  $salts_file   = "${config_dir}/wp-salts.php"
  $wp_cli_deb   = 'php-wpcli_0.17.0_all.deb'
  $wp_cli_url   = "https://github.com/wp-cli/builds/raw/gh-pages/deb/${wp_cli_deb}"
  $wp_cli_tmp   = "/tmp/${wp_cli_deb}"
}