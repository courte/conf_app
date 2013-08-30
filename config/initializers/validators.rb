ActiveRecord::Base.class_eval do
	
	#Validates that an attribute is after a given, default = Time.now
	def self.validates_is_after(*attr_names)
		# Sets the default configuration
		configuration = { :after => Time.now }
		
		# Update defaults with any supplied configuration values
		configuration.update(attr_names.extract_options!)
		
		# Validates each attribute, passing in the configuration
		validates_each(attr_names) do |record, attr_name, value|
			unless value.nil?
				if configuration[:after].is_a?(Time)
					after_time = configuration[:after]
				else
					after_time = record.send(configuration[:after])
				end

				unless after_time.nil?
					record.errors.add(attr_name, 'must be after ' + 
					configuration[:after].to_s) if value <= after_time
				end
			end
		end
	end
end