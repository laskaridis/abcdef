module Commands
  class Remove < Command
    def execute(opts = [])
      x = opts.shift
      raise Commands::Error, "No x location specified" unless x
      y = opts.shift
      raise Commands::Error, "No y location specified" unless y
      raise Commands::Error, "No store initialized" unless @app.store

      location = ::Location.new(x, y)
      @app.store.remove(location)
    end
  end
end
