module Ralias::Command
  define("help") do
    with_color(:red) do
      <<-HELP
help             -> print help
init             -> create ~/.raliasrc
new              -> create new aliase command
list             -> print defined aliase command
HELP
    end
  end
  built_in_commands << "help"

  define("init") do
    unless File.exist?(rc_path)
      File.open(rc_path, "w") do |rc_file|
        rc_file.puts <<-'EXAMPLE'
#  Example
#
#  normal alias definition
#
#    define("lsA") { "ls -al" }
#
#  if you want to use the arguments to the alias
#
#    define("github") do |user_name, repository|
#      "git clone https://github.com/#{user_name}/#{repository}.git"
#    end
        EXAMPLE
      end
      with_color(:yellow) { "create file #{rc_path}" }
    end
  end
  built_in_commands << "init"

  define("new") do |name, alias_command|
  end
  built_in_commands << "new"

  define("list") do
  end
  built_in_commands << "list"
end
