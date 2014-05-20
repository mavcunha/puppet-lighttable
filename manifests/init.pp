# Public: Installs LightTable
class lighttable ($version = '0.6.5')  {
  package { 'lighttable':
    source   => "https://d35ac8ww5dfjyg.cloudfront.net/playground/bins/${version}/LightTableMac.zip",
    provider => 'compressed_app',
  }
}
