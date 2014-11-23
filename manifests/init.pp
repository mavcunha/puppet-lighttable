# Public: Installs LightTable
class lighttable ($version = '0.7.2')  {

  $lighttable_source = "https://d35ac8ww5dfjyg.cloudfront.net/playground/bins/${version}/LightTableMac.zip"
  $cached_source = '/tmp/LightTableMac.zip'

  exec { 'LightTableDownload':
    command => "/usr/bin/curl ${lighttable_source} -Lqo ${cached_source}",
    creates => '/Applications/LightTable/LightTable.app',
  }

  exec { 'LightTableUnzip':
    command => "/usr/bin/ditto -xk ${cached_source} /Applications",
    require => Exec['LightTableDownload'],
    onlyif  => "/bin/ls ${cached_source} &> /dev/null",
    creates => '/Applications/LightTable/LightTable.app',
    notify  => [File['/Applications/LightTable'], File['/usr/local/bin/light']],
  }

  file { '/usr/local/bin/light':
    ensure  => 'link',
    target  => '/Applications/LightTable/light',
  }

  # plugins are downloaded locally to LightTable directory
  # we got have write permissions
  file { '/Applications/LightTable':
    recurse => true,
    owner   => $::boxen_user,
    group   => 'admin',
  }
}
