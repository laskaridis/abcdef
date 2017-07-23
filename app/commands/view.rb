module Commands
  class View < Command
    def execute(opts = nil)
      raise Commands::Error, "No store initialized" unless @app.store

      ::StorePrinter.new(@app.store).render
    end
  end
end
