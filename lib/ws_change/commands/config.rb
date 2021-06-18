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
          workspace["url"]      = prompt.ask("URL:") do |q|
            q.validate(/(((ftp|http|https):\/\/)|(\/)|(..\/))(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/, "Enter a valid URL http://host/")
          end

          begin
            workspace["seconds"]  = prompt.ask("Provide keys and values: ", convert: :int, default: 60) do |q|
              q.in "1-999"
              q.messages[:range?] = "%{value} out of expected range %{in}"
            end
          rescue => exception
            
          end
                    
          workspaces.push(workspace)
          new_workspace = prompt.yes?("add new workspace")
        end

        workspaces

      end
    end
  end
end
