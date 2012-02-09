module Ralias
  module CLI
    def self.start(args)
      command = args.shift.strip rescue "help"
      Ralias::Command.load
      Ralias::Command.run(command, args)
    end
  end
end

