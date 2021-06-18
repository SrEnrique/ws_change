# frozen_string_literal: true

require_relative '../command'

module WsChange
  module Commands
    class Config < WsChange::Command
      def initialize(options)
        @options = options
      end


      #
      # workspaces
      #   - Desktop 1
      #       - 
      #
      #
      #
      #
      #

      def execute(input: $stdin, output: $stdout)
        # Command logic goes here ...

        config_file = config
        config_file.filename = "workspace"
        config_file.extname = ".json"
        workspaces = getWorkspaces()
        config_file.set( :workspaces, value: workspaces)
        output.puts "Write file workspace"

        config_file.write

        output.puts "OK"

      end
      
      def getWorkspaces

        new_workspace=true
        
        workspaces=[]
        while new_workspace
          workspace={}
          workspace["url"]      = prompt.ask("URL:") 
          workspace["seconds"]  = prompt.ask("Provide keys and values: ", convert: :int)          
          workspaces.push(workspace)
          new_workspace = prompt.yes?("add new workspace")
        end

        workspaces

      end
    end
  end
end
