# Configure apt resources
class profile::apt {
  class { 'apt':
    update  => {
      frequency => 'daily',
      loglevel  => 'info',
    },
    sources => lookup('sources', Hash, 'hash'),
  }
}
