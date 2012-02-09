# Ralias

## Build Status

<img src="https://secure.travis-ci.org/daic-h/ralias.png"/>

## Supported versions

* Ruby 1.8.7, 1.9.x, ree

## Install

    $ gem install ralias

## How to use

you type.

    $ ralias

Help will be output.

    help      -> print help
    init      -> create ~/.raliasrc
    list      -> print defined aliase command
    define    -> define new aliase command (TODO)

## .raliasrc

### Example

normal alias definition

    define("lsA") { "ls -al" }

if you want to use the arguments to the alias

    define("github") do |user_name, repository|
      "git clone https://github.com/#{user_name}/#{repository}.git"
    end

In that case, you use it in this manner

    $ ralias github user_name repository

The result is

    load ~/.raliasrc
    Cloning into repository...

