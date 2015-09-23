require "log4r"

require "vagrant/util/retryable"

module VagrantPlugins
  module SyncedFolderWinRM
    class SyncedFolder < Vagrant.plugin("2", :synced_folder)
      include Vagrant::Util::Retryable

      def initialize(*args)
        super
        @logger = Log4r::Logger.new("vagrant::synced_folders::winrm")
      end

      def usable?(machine, _raise_error = false)
        machine.config.vm.communicator == :winrm
      end

      def prepare(_machine, _folders, _opts)
      end

      def enable(machine, folders, _nfsopts)
        folders.each do |_id, data|
          hostpath  = File.expand_path(data[:hostpath], machine.env.root_path)
          guestpath = data[:guestpath]
          sync machine, hostpath, guestpath
        end
      end

      def cleanup(_machine, _opts)
      end

      private

      def sync(machine, hostpath, guestpath)
        machine.ui.info("Uploading with WinRM: #{hostpath} => #{guestpath}")
        machine.communicate.tap do |comm|
          # When syncing many files, we've see SEC_E_INVALID_TOKEN errors
          # that appear to be transient (try again and it goes away). Let's
          # retry a few times to add some robustness.
          attempts = 1
          retryable(tries: 3, sleep: 1) do
            @logger.debug("Attempting WinRM upload attempt number #{attempts}")
            comm.upload(hostpath, guestpath)
            attempts += 1
          end
        end
      end
    end
  end
end
