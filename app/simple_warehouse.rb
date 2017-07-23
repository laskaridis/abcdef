class SimpleWarehouse
  attr_accessor :store

  PROMPT = "> "

  def run
    @live = true
    puts 'Type `help` for instructions on usage'

    while @live
      begin
        print PROMPT
        args = gets.chomp.split(' ')
        cmd = Commands.find(args.shift, self)
        cmd.execute(args)
      rescue Commands::Error => e
        print "#{e.message}\n"
      end
    end
  end

  def stop
    puts 'Thank you for using simple_warehouse!'
    @live = false
  end
end
