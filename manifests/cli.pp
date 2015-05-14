class wordpress::cli {
  exec { 'get wp-cli':
    cwd      => '/tmp',
    command  => "/usr/bin/curl -qLo ${wp_cli_tmp} ${wp_cli_url}",
  }
  ->
  exec { 'install wp-cli':
    command     => "/usr/bin/dpkg -i ${wp_cli_tmp}",
    require     => File['wp-config.php'],
  }

  file { '/wp-cli.yml':
    content  => 'path: /var/www',
    owner    => '0',
    group    => '0',
    mode     => '0644',
  }
}