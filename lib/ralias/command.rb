module Ralias
  module Command
    extend Color

    class << self

      def rc_path
        File.expand_path("~/.raliasrc")
      end

      def clear
        @@commands = {}
      end

      def commands
        @@commands ||= {}
      end

      def built_in_commands
        @@built_in_commands ||= []
      end

      def define(name, &block)
        return if commands[name]
        commands[name] = block
      end

      def load
        require 'ralias/define_commands'

        begin
          if File.exist?(rc_path)
            class_eval(File.open(rc_path).read)
            with_color(:cyan) { "load ~/.raliasrc" }
          end
        rescue NameError
          with_color(:red) { "could not be load ~/.raliasrc" }
        rescue
          nil
        end
      end

      def run(_cmd, args)
        cmd = commands[_cmd] || (raise CommandNotFound)
        required_args = cmd.parameters

        if required_args.size == args.size
          if built_in_commands.include?(_cmd)
            cmd.call(*args)
          else
            (system cmd.call(*args))
          end
        else
          with_color(:red) do
            "wrong number of arguments (#{args.size} for #{required_args.size}) (ArgumentError)"
          end

          required_args.each do |arg|
            with_color { "argumets: " + arg[1].to_s }
          end
        end
      rescue CommandNotFound
        with_color(:red) { "command not found." }
      rescue
        with_color(:red) { "error in the definition file." }
      end
    end
  end
end
