module Commands
  class Store < Command
    def execute(opts = [])
      x = opts.shift
      raise Commands::Error, "No x location provided" unless x
      y = opts.shift
      raise Commands::Error, "No y location provided" unless y
      w = opts.shift
      raise Commands::Error, "No crate width provided" unless w
      h = opts.shift
      raise Commands::Error, "No crate height provided" unless h
      p = opts.shift
      raise Commands::Error, "No product name provided" unless p
      raise Commands::Error, "No store initialized" unless @app.store

      crate = ::Crate.new(p, w, h)
      location = ::Location.new(x, y)
      store = @app.store
      store.store crate, at: location
    end
  end
end
