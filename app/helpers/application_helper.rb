module ApplicationHelper
	def flash_class(level)
		case level
		when :alert then "alert-box cancel-success warning"
		end
	end
end
