module Ralias::Command
  define("help") do
    with_color(:red) do
      <<-HELP
help             -> print help
init             -> create ~/.raliasrc
list             -> print defined aliase command
define           -> define new aliase command (TODO)
HELP
    end
  end
  built_in_commands << "help"

  define("init") do
    unless File.exist?(rc_path)
      File.open(rc_path, "w") do |rc_file|
        rc_file.puts <<-'EXAMPLE'
# -*- coding: utf-8; mode: ruby; -*-
#
# Example
#
#  normal alias definition
#
#      define("lsA") { "ls -al" }
#
#  if you want to use the arguments to the alias
#
#      define("github") do |user_name, repository|
#        "git clone https://github.com/#{user_name}/#{repository}.git"
#      end
#
        EXAMPLE
      end
      with_color(:yellow) { "create file #{rc_path}" }
    else
      with_color(:green) { "exist file #{rc_path}" }
    end
  end
  built_in_commands << "init"

  define("define") do
    with_color(:red) { "TODO" }
  end
  built_in_commands << "define"

  define("list") do
    commands.each do |command, block|
      unless block.parameters.empty?
        block.parameters.each do |param|
          command += (" :" +param[1].to_s)
        end
      end

      with_color(:green) { command }
    end
  end
  built_in_commands << "list"

  #
  # Use in the command function here
  #
  class << self
    def b_cd(command = "")
      %Q(cd #{command.to_s} && exec /bin/bash)
    end

    def z_cd(command = "")
      %Q(cd #{command.to_s} && exec /bin/zsh)
    end
  end
end
