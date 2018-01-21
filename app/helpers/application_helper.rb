module ApplicationHelper
	def markdown(text)
		options = {
			filter_html: true,
			hard_wrap: true,
			safe_links_only: true,
			link_attributes: { rel: 'nofollow', target: "_blank" },
			no_images: true
		}

		extensions = {
			autolink: true,
      		superscript: true,
      		disable_indented_code_blocks: true,
      		tables: true,
      		footnotes: true
		}

		renderer = Redcarpet::Render::HTML.new(options)
    	markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, extensions)

    	markdown.render(text).html_safe
	end
end
