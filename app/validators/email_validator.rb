class EmailValidator < ActiveModel::EachValidator
	def validate_each(object, attribute, value)
    	unless (value =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i) || value == nil || value == ''
      		object.errors[attribute] << (options[:message] || "must be a valid email address")
    	end
  	end
end