Pry.commands.alias_command 'c', 'continue'
Pry.commands.alias_command 's', 'step'

ActiveRecord::Base.logger = Logger.new(STDOUT)

