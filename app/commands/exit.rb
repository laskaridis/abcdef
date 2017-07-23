module Commands
  class Exit < Command
    def execute(opts = nil)
      @app.stop
    end
  end
end
