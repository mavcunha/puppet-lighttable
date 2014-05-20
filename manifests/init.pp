# Public: Installs LightTable
class lighttable ($version = '0.6.5')  {
  package { 'LightTable':
    source   => "https://d35ac8ww5dfjyg.cloudfront.net/playground/bins/${version}/LightTableMac.zip",
    provider => 'compressed_app',
  }
  file { '/usr/local/bin/light':
    ensure  => 'link',
    target  => '/Applications/LightTable/light',
    require => Package['LightTable'],
  }
  # plugins are downloaded locally to LightTable directory
  # we got have write permissions
  file { '/Applications/LightTable':
    recurse => true,
    owner   => $::boxen_user,
    group   => 'staff',
    require => Package['LightTable'],
  }
}
