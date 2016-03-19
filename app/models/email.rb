class Email < ActiveRecord::Base
	validates_format_of :mail,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
end
