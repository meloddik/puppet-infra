# Configure apt resources
class profile::apt {
  class { 'apt':
    sources => lookup('sources', Hash, 'hash'),
  }
}
