require 'hirb'
Hirb.enable

require 'wirb'
Wirb.start

old_print = Pry.config.print
Pry.config.print = proc do |output, value|
  Hirb::View.view_or_page_output(value) || old_print.call(output, value)
end

# require "awesome_print"

if Kernel.const_defined?("Rails") then
  require File.join(Rails.root,"config","environment")
  require 'rails/console/app'
  require 'rails/console/helpers'
  Pry::RailsCommands.instance_methods.each do |name| 
    Pry::Commands.command name.to_s do 
      Class.new.extend(Pry::RailsCommands).send(name)
    end
  end
end

# AwesomePrint.pry!

Pry.config.commands.alias_command "e", "exit"
Pry.config.commands.alias_command "r", "reload!"
Pry.config.commands.alias_command "s", "show-routes"
