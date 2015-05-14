node default {




  $wp_plugin_dir = '/var/www/wp-content/plugins'

  file {
    [ "${wp_plugin_dir}",
      "${wp_plugin_dir}/akismet",
      "${wp_plugin_dir}/simplesamlphp-authentication",
      "${wp_plugin_dir}/amazon-web-services",
      "${wp_plugin_dir}/amazon-s3-and-cloudfront",
      "${wp_plugin_dir}/wp-aws-plugin-fixes",
      "${wp_plugin_dir}/wp-mail-setup",
    ]:
      ensure => 'directory',
      owner  => '0',
      group  => '0',
      mode   => '0755',
  }

  exec { 'install akismet plugin':
    command => '/usr/bin/svn co http://plugins.svn.wordpress.org/akismet/tags/3.0.4/ .',
    cwd     => "${wp_plugin_dir}/akismet",
    require => [
      File["${wp_plugin_dir}/akismet"],
      Package['subversion'],
    ],
  }

  exec { 'install simplesamlphp-authentication plugin':
    command => '/usr/bin/svn co http://plugins.svn.wordpress.org/simplesamlphp-authentication/tags/0.7.0/ .',
    cwd     => "${wp_plugin_dir}/simplesamlphp-authentication",
    require => [
      File["${wp_plugin_dir}/simplesamlphp-authentication"],
      Package['subversion'],
    ],
  }

  exec { 'install amazon-s3-and-cloudfront plugin':
    command => '/usr/bin/svn co http://plugins.svn.wordpress.org/amazon-s3-and-cloudfront/tags/0.8.1/ .',
    cwd     => "${wp_plugin_dir}/amazon-s3-and-cloudfront",
    require => [
      File["${wp_plugin_dir}/amazon-s3-and-cloudfront"],
      Package['subversion'],
    ],
  }

  exec { 'install amazon-web-services plugin':
    command => '/usr/bin/svn co http://plugins.svn.wordpress.org/amazon-web-services/tags/0.2.2/ .',
    cwd     => "${wp_plugin_dir}/amazon-web-services",
    require => [
      File["${wp_plugin_dir}/amazon-web-services"],
      Package['subversion'],
    ],
  }

  exec { 'install wp-aws-plugin-fixes plugin':
    command => '/usr/bin/git clone https://github.com/scottylogan/wp-aws-plugin-fixes.git .',
    cwd     => "${wp_plugin_dir}/wp-aws-plugin-fixes",
    require => [
      File["${wp_plugin_dir}/wp-aws-plugin-fixes"],
      Package['git'],
    ],
  }

  exec { 'install wp-mail-setup plugin':
    command => '/usr/bin/git clone https://github.com/scottylogan/wp-mail-setup.git .',
    cwd     => "${wp_plugin_dir}/wp-mail-setup",
    require => [
      File["${wp_plugin_dir}/wp-mail-setup"],
      Package['git'],
    ],
  }
}

