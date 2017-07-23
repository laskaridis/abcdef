module Commands
  class Init < Command
    def execute(opts = [])
      width = opts.shift
      raise Commands::Error, "No store width provided" unless width
      height = opts.shift
      raise Commands::Error, "No store height provided" unless height

      puts "Initializing store (width x height): #{width} x #{height}"
      @app.store = ::Store.new(width.to_i, height.to_i)
    end
  end
end
