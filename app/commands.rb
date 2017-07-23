require_relative "commands/command"
require_relative "commands/exit"
require_relative "commands/help"
require_relative "commands/init"
require_relative "commands/store"
require_relative "commands/locate"
require_relative "commands/remove"
require_relative "commands/view"

module Commands
  CMD_HELP = "help"
  CMD_EXIT = "exit"
  CMD_INIT = "init"
  CMD_STORE = "store"
  CMD_LOCATE = "locate"
  CMD_REMOVE = "remove"
  CMD_VIEW = "view"

  class Error < RuntimeError
    attr_reader :message

    def initialize(msg)
      @message = msg
    end
  end

  def find(cmd, app)
    case cmd
    when CMD_HELP then Help.new(app)
    when CMD_EXIT then Exit.new(app)
    when CMD_INIT then Init.new(app)
    when CMD_STORE then Store.new(app)
    when CMD_LOCATE then Locate.new(app)
    when CMD_REMOVE then Remove.new(app)
    when CMD_VIEW then Commands::View.new(app)
    else Command.new(app)
    end
  end

  extend self
end
