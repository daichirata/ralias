module Ralias
  module Command
    extend Color

    def self.commands
      @@commands ||= {}
    end

    def self.define(name, &block)
      commands[name] ||= block
    end

    def self.loader
      require 'ralias/define_commands'

      begin
        rc_path = File.expand_path("~/.raliasrc")
        class_eval(File.open(rc_path).read) if File.exist?(rc_path)
        with_color(:cyan) { "load ~/.raliasrc" }
      rescue
        nil
      end
    end

    def self.run(_cmd, args)
      cmd = commands[_cmd]
      required_args = cmd.parameters

      unless required_args.size == args.size
        with_color(:red){ "wrong number of arguments (#{args.size} for #{required_args.size}) (ArgumentError)" }
        required_args.each do |arg|
          with_color { "argumets: " + arg[1].to_s }
        end
      else
        system cmd.call(*args)
      end

    rescue NoMethodError
      with_color(:red) { "command not found." }
    end
  end
end
