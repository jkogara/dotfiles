 # === EDITOR ===
$LOAD_PATH << '~/.rvm/gems/ruby-2.0.0-p353@global/gems/awesome_print-1.2.0/lib/'
$LOAD_PATH << '~/.rvm/gems/ruby-2.0.0-p353@global/gems/hirb-0.7.1/lib/'
Pry.editor = 'vim'

# === CUSTOM PROMPT ===
# This prompt shows the ruby version (useful for RVM)
Pry.prompt = [proc { |obj, nest_level, _| "#{RUBY_VERSION} (#{obj}):#{nest_level} > " }, proc { |obj, nest_level, _| "#{RUBY_VERSION} (#{obj}):#{nest_level} * " }]

Pry.config.ls.heading_color = :magenta
Pry.config.ls.public_method_color = :green
Pry.config.ls.protected_method_color = :yellow
Pry.config.ls.private_method_color = :bright_black

require 'awesome_print'
Pry.config.print = proc { |output, value| output.puts value.ai }

require 'hirb'

if defined? Hirb
  # Dirty hack to support in-session Hirb.disable/enable
  Hirb::View.instance_eval do
    def enable_output_method
      @output_method = true
      Pry.config.print = proc do |output, value|
        Hirb::View.view_or_page_output(value) || output.puts(value.ai)
      end
    end

    def disable_output_method
      Pry.config.print = proc { |output, value| output.puts(value.ai) }
      @output_method = nil
    end
  end
end

# === CUSTOM COMMANDS ===
# from: https://gist.github.com/1297510
 default_command_set = Pry::CommandSet.new do
   command "copy", "Copy argument to the clip-board" do |str|
     IO.popen('pbcopy', 'w') { |f| f << str.to_s }
   end

  command "clear" do
    system 'clear'
    if ENV['RAILS_ENV']
      output.puts "Rails Environment: " + ENV['RAILS_ENV']
    end
  end

   command "sql", "Send sql over AR." do |query|
     if ENV['RAILS_ENV'] || defined?(Rails)
       pp ActiveRecord::Base.connection.select_all(query)
     else
       pp "No rails env defined"
     end
   end

   command "oxi_setup" do |stuff|
     require 'oxi'
     Oxi.password='testing'
     Oxi.username='pplotto'
     @oxi = Oxi::Client.new()
     @token = 'bde83IdQKu6fhp4PWRgaJfANYY8Oy17323bQcWHH+FGbbjRFih+zegGKfdRjMbLesgSnnBR42A=='
     return @oxi
   end
   command "caller_method" do |depth|
     depth = depth.to_i || 1
     if /^(.+?):(\d+)(?::in `(.*)')?/ =~ caller(depth+1).first
       file   = Regexp.last_match[1]
       line   = Regexp.last_match[2].to_i
       method = Regexp.last_match[3]
       output.puts [file, line, method]
     end
   end
 end

Pry.config.commands.import default_command_set
Pry.commands.alias_command 'c', 'continue'
Pry.commands.alias_command 's', 'step'
Pry.commands.alias_command 'n', 'next'

