module ApplicationHelper
	def markdown(text)
		md = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
		raw md.render(text)
	end
end
