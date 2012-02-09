require File.dirname(__FILE__) + '/spec_helper'
require 'ralias/define_commands'

describe Ralias::Command do
  context 'when the initial state' do
    it 'We can find help' do
      Ralias::Command.commands.should include('help')
    end

    it 'We can find init' do
      Ralias::Command.commands.should include('init')
    end

    it 'We can find define' do
      Ralias::Command.commands.should include('define')
    end

    it 'We can find list' do
      Ralias::Command.commands.should include('list')
    end
  end

  context 'when define a command' do
    before do
      Ralias::Command.clear
      @block = lambda {}
      Ralias::Command.define('mock_command', &@block)
    end

    it 'We can find it' do
      Ralias::Command.commands.should include('mock_command')
    end

    it 'We can find nil with wrong name' do
      Ralias::Command.commands.should_not include('mock_sub_command')
    end

    describe 'Command.[]' do
      it 'can get a command' do
        Ralias::Command.commands['mock_command'].should eq(@block)
      end
    end
  end
end
