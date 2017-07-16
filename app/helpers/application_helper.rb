module ApplicationHelper
	def full_title(*parts)
	  unless parts.empty?
			content_for :title do
				(parts << 'Ticketee').join(' - ')
			end
		end
	end
end
