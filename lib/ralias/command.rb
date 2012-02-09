module Ralias
  module Command
    extend Color

    def self.rc_path
      File.expand_path("~/.raliasrc")
    end

    def self.commands
      @@commands ||= {}
    end

    def self.built_in_commands
      @@built_in_commands ||= []
    end

    def self.define(name, &block)
      commands[name] ||= block
    end

    def self.loader
      require 'ralias/define_commands'

      begin
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
        with_color(:red) do
          "wrong number of arguments (#{args.size} for #{required_args.size}) (ArgumentError)"
        end

        required_args.each do |arg|
          with_color { "argumets: " + arg[1].to_s }
        end
        raise CommandNotFound
      else
        if built_in_commands.include?(_cmd)
          cmd.call(*args)
        else
          system cmd.call(*args)
        end
      end

    rescue
      with_color(:red) { "command not found." }
    end
  end
end
