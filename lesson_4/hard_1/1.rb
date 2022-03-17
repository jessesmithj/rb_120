# Alyssa has been assigned a task of modifying a class that was initially created to keep 
# track of secret information. The new requirement calls for adding logging, when clients of 
# the class attempt to access the secret data. Here is the class in its current form:

# She needs to modify it so that any access to data must result in a log entry being generated. 
# That is, any call to the class which will result in data being returned must first call a logging 
# class. The logging class has been supplied to Alyssa and looks like the following:

# Hint: Assume that you can modify the initialize method in SecretFile to have an instance of SecurityLogger 
# be passed in as an additional argument. It may be helpful to review the lecture on collaborator objects 
# for this practice problem.

class SecretFile
  require 'date'
  attr_reader :log_access

  def initialize(secret_data, logs)
    @data = secret_data
    @logs = logs
    @log_access = []
  end

  def retrieve_data
    log_access << logs.create_log_entry #<< "Logged on #{Time.new.inspect}"
    data
  end

  private

  attr_reader :data, :logs
end

class SecurityLogger
  def create_log_entry
    "Logged on #{Time.new.inspect}"
  end
end

jesse = SecretFile.new("secret text", SecurityLogger.new)
p jesse.retrieve_data
p jesse.retrieve_data
p jesse.log_access
p jesse.retrieve_data
p jesse.log_access



#LS

class SecretFile
  def initialize(secret_data, logger)
    @data = secret_data
    @logger = logger
  end

  def data
    @logger.create_log_entry
    @data
  end
end