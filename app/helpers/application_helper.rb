module ApplicationHelper
	def full_title(*parts)
	  unless parts.empty?
			content_for :title do
				(parts << 'Ticketee').join(' - ')
			end
		end
	end

	def admin_only(&block)
		block.call if current_user.try(:admin?)
	end
end
