# frozen_string_literal: true

require_relative '../command'

module WsChange
  module Commands
    class Start < WsChange::Command
      def initialize(file, options)
        @file = file
        @options = options
      end

      def execute(input: $stdin, output: $stdout)
        # Command logic goes here ...
        #validate requeriments 

        exit 1 unless requeriments_exist()
        
        workspaces = get_workspaces()

        begin
          initialize_workspaces(workspaces)
          workspace_loop(workspaces)
        rescue SystemExit, Interrupt
          raise
        rescue Exception => e
          #...
          puts "Error"
        end
        

   
      end



      def initialize_workspaces(workspaces)
        workspace_num=0
        workspaces.each do |workspace|
          command.run("wmctrl -s #{workspace_num}")
          command.run("firefox --new-window --kiosk #{workspace["url"]} &")
          command.run("sleep 30")
          workspace_num+=1
        end
        
      end

      def workspace_loop(workspaces)
        while true
          workspace_num=0
          workspaces.each do |workspace|
            command.run("wmctrl -s #{workspace_num}")            
            command.run("sleep #{workspace["seconds"]}s")
            workspace_num+=1
          end
        end
      end

      def requeriments_exist()
        unless exec_exist?("wmctrl")
          puts "[Install wmctlr]"
          puts "execute sudo apt install wmctrl"
          return false
        end
        return true
      end

      def get_workspaces
        config_file = config
        config_file.read(@file, format: :json)
        config_file.fetch(:workspaces)
      end
    end
  end
  