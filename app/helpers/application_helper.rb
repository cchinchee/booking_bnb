module ApplicationHelper
	def flash_class(level)
	    case level
	        when "info" then "alert alert-info"
	        when "success" then "alert alert-success"
	        when "errors" then "alert alert-error"
	        when "alert" then "alert alert-error"
	    end
	end
end
