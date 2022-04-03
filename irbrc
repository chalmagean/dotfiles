require 'irb'
require 'irb/completion'
require 'rubygems'
require 'pp'


IRB.conf[:USE_AUTOCOMPLETE] = false
IRB.conf[:SAVE_HISTORY] = 200
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"

IRB.conf[:PROMPT][:MY_PROMPT] = { # name of prompt mode
  :AUTO_INDENT => true,           # enables auto-indent mode
  :PROMPT_I =>  ">> ",            # simple prompt
  :PROMPT_S => nil,               # prompt for continuated strings
  :PROMPT_C => nil,               # prompt for continuated statement
  :RETURN => "    ==>%s\n"        # format to return value
}

IRB.conf[:PROMPT_MODE] = :MY_PROMPT

IRB.conf[:IRB_NAME]="irb"
IRB.conf[:MATH_MODE]=false
# IRB.conf[:INSPECT_MODE]=nil
IRB.conf[:IRB_RC] = nil
IRB.conf[:BACK_TRACE_LIMIT]=16
IRB.conf[:USE_LOADER] = false
IRB.conf[:USE_READLINE] = nil
IRB.conf[:USE_TRACER] = false
IRB.conf[:IGNORE_SIGINT] = true
IRB.conf[:IGNORE_EOF] = false
IRB.conf[:PROMPT_MODE] = :DEFAULT
IRB.conf[:DEBUG_LEVEL]=0


def ri(*names)
  system(%{ri #{names.map {|name| name.to_s}.join(" ")}})
end

class Class
  public :include

  # Show only this class class methods
  def class_methods
    (methods - Class.instance_methods - Object.methods).sort
  end

  # Show instance and class methods
  def defined_methods
    methods = {}

    methods[:instance] = new.local_methods
    methods[:class] = class_methods

    methods
  end
end

class Object
  # Show local methods from the object's class
  def defined_methods
    (methods - Object.instance_methods).sort
  end

  # Open a particular method in an editor
  def ocode(method_name)
    file, line = self.method(method_name).source_location

    if file && line
      # or code -g
      `nvim '#{file}:#{line}'`
    else
      "'#{method_name}' not found."
    end
  end
end

if ENV['RAILS_ENV']
  IRB.conf[:IRB_RC] = Proc.new do
    logger = Logger.new(STDOUT)
    ActiveRecord::Base.logger = logger
  end
end
