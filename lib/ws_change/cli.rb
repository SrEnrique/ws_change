# frozen_string_literal: true

require 'thor'

module WsChange
  # Handle the application command line parsing
  # and the dispatch to various command objects
  #
  # @api public
  class CLI < Thor
    # Error raised by this runner
    Error = Class.new(StandardError)

    desc 'version', 'ws_change version'
    def version
      require_relative 'version'
      puts "v#{WsChange::VERSION}"
    end
    map %w(--version -v) => :version

    desc 'start [FILE]', 'requiere file config default workspace.json'
    method_option :help, aliases: '-h', type: :boolean,
                         desc: 'Display usage information'
    def start(file="workspace.json")
      if options[:help]
        invoke :help, ['start']
      else
        require_relative 'commands/start'
        WsChange::Commands::Start.new(file, options).execute
      end
    end

    desc 'config', 'config workspace.json'
    method_option :help, aliases: '-h', type: :boolean,
                         desc: 'Display usage information'
    def config(*)
      if options[:help]
        invoke :help, ['config']
      else
        require_relative 'commands/config'
        WsChange::Commands::Config.new(options).execute
      end
    end
  end
end
