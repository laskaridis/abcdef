module Commands
  class Command
    def initialize(app)
      @app = app
    end

    def execute(opts = nil)
      puts 'Command not found. Type `help` for instructions on usage'
    end
  end
end
