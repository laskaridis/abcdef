module Commands
  class Locate < Command
    def execute(args = [])
      p = args.shift
      raise Commands::Error, "No product name specified" unless p
      raise Commands::Error, "No store initialized" unless @app.store

      @app.store.locate(p)
    end
  end
end
