require "vagrant"

module VagrantPlugins
  module SyncedFolderWinRM
    # This plugin implements WinRM synced folders.
    class Plugin < Vagrant.plugin("2")
      name "WinRM synced folders"
      description <<-EOF
      The WinRM synced folders plugin enables you to use WinRM as a mechanism
      to transfer files to a guest machine. There are known limitations to this
      mechanism, most notably that file tranfer is slow for large numbers of files.
      EOF

      # The 6 below represents priority. Choosing a value of 6 puts it right in between
      # the built in synced folder implementations of SMB (7) and RSync (5), which is
      # useful since the SMB implementation has some non-trivial prerequisites and the
      # RSync implementation isn't guaranteed to work on Windows natively. This provides
      # a nice way to fall back to something that is pretty sure to work, with the cost
      # being slower transfer times.
      synced_folder("winrm", 6) do
        require_relative "synced_folder"
        init!
        SyncedFolder
      end

      def self.init!
      end
    end
  end
end
