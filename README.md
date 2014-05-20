[![Build Status](https://snap-ci.com/mavcunha/puppet-lighttable/branch/master/build_image)](https://snap-ci.com/mavcunha/puppet-lighttable/branch/master)

# Light Table

[LightTable](http://www.lighttable.com/) - the next generation code editor

## Usage

Choose what applications you want installed, you can override the default
versions by using `version => 'X.X.X'`.

```puppet
# to install LightTable
class { 'lighttable':
  version => '0.6.5',
}
```

## Required Puppet Modules

* `boxen`

## Development

Write code. Run `script/cibuild` to test it. Check the `script`
directory for other useful tools.
