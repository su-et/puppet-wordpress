class wordpress (
  $base_dir     = $wordpress::defaults::base_dir,
  $config_dir   = $wordpress::defaults::config_dir,
  $content_dir  = $wordpress::defaults::content_dir,
  $plugins_dir  = $wordpress::defaults::plugins_dir,
  $themes_dir   = $wordpress::defaults::themes_dir,
  $uploads_dir  = $wordpress::defaults::uploads_dir
) inherits wordpress::defaults {

  include wordpress::defaults

  file { $salts_file:
    ensure  => 'file',
    content => "<?php\n",
    owner   => '0',
    group   => '0',
    mode    => '0644',
  }

  file { 'wp-config.php':
    ensure => 'file',
    path   => "${config_dir}/wp-config.php",
    source => template("${module_name}/wp-config.php.erb"),
    owner  => '0',
    group  => '0',
    mode   => '0644',
  }

  exec { 'get salts':
    command => "/usr/bin/curl -qL https://api.wordpress.org/secret-key/1.1/salt/ >>${salts_file}",
    require => File[$salts_file],
  }


}



