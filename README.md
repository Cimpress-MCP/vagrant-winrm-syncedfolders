# vagrant-winrm-syncedfolders

vagrant-winrm-syncedfolders is a Vagrant plugin that allows you to use WinRM as a folder synchronization mechanism.

*Limitations:* The WinRM communicator that is used to perform the folder synchronization is known to be slow for large directories.

## Installation

*Note:* vagrant-winrm-syncedfolders versions 1.0.0 and later *only* supports
Vagrant 1.7.4 and later, due to an issue with the version of `winrm-fs`
bundled with the installer.

Vagrant 1.7.4 users can install this plugin via:

    vagrant plugin install vagrant-winrm-syncedfolders

Vagrant 1.7.2 users will need to continue using an old version of the plugin via:

    vagrant plugin install vagrant-winrm-syncedfolders --plugin-version 0.1.0

## Usage

Upon installation of this plugin the priority order of synced folders for Windows guests will be as follows:

  - SMB (Windows host only)
  - WinRM
  - Rsync

It is also possible to force a synced folder to use the WinRM folder sync:

    config.vm.synced_folder ".", "/vagrant", type: "winrm"

## Contributing

In order to run this locally, the Vagrantfile is set to use the [boxcutter](https://github.com/boxcutter/windows)/eval-win7x86-enterprise box. If you don't already have this installed, here are some [instructions](https://github.com/tknerr/vagrant-managed-servers/pull/48).

1. Fork it ( https://github.com/Cimpress-MCP/vagrant-winrm-syncedfolders/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Run the lint and build locally (`bundle exec rake build`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create a new Pull Request
