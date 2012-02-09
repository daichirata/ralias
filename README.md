# Ralias

This library is extended so that it can be used to rich your shell more :)

## Build Status

<img src="https://secure.travis-ci.org/daic-h/ralias.png"/>

## Supported versions

* Ruby 1.8.7, 1.9.x, ree

## Install

    $ gem install ralias

## How to use

you type

    $ ralias

help will be output.

    help      -> print help
    init      -> create ~/.raliasrc
    list      -> print defined aliase command
    define    -> define new aliase command (TODO)

## Ralias init

create .raliasrc file.

    $ ralias init

## .raliasrc

### An example of how editing

normal alias definition.

    define("lsA") { "ls -al" }

please use this way.

    $ ralias lsA

if you want to use the arguments to the alias

    define("github") do |user_name, repository|
      "git clone https://github.com/#{user_name}/#{repository}.git"
    end

in that case, you use it in this manner.

    $ ralias github user_name repository

result is

    load ~/.raliasrc
    Cloning into repository...
    ...

## $ ralias list

print defined aliase command.

if the initial state,

    help
    init
    define
    list

if after you define the command.

    help
    init
    define
    list
    github :user_name :repository
