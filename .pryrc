# Alias
Pry.config.commands.alias_command 'w', 'whereami'

# refs: https://github.com/pry/pry/wiki/FAQ#wiki-awesome_print
if defined? AwesomePrint
  begin
    require 'awesome_print'
    AwesomePrint.pry!
  rescue LoadError => err
    puts "no awesome_print :("
    puts err
  end
end
