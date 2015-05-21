# vagrant-winrm-syncedfolders

Vagrant plugin that allows you to use WinRM as a folder synchronization mechanism.

*Limitations:* The WinRM communicator that is used to perform the folder synchronization is known to be slow for large numbers of files.

## Installation

    vagrant plugin install vagrant-winrm-syncedfolders

## Usage

Upon installation of this plugin the priority order of synced folders for Windows guests will be as follows:

  - SMB
  - WinRM
  - Rsync

It is also possible to force a synced folder to use the WinRM:

    config.vm.synced_folder ".", "/vagrant", type: "winrm"

## Contributing

1. Fork it ( https://github.com/Cimpress-MCP/vagrant-winrm-syncedfolders/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Run the tests (`bundle exec rake build`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create a new Pull Request
