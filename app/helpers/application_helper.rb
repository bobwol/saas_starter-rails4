module ApplicationHelper
  # Returns the full title on a per-page basis
  def full_title(page_title)
    base_title = ENV["SITE_NAME"]
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
  
  def markdown(text)
    # Initializes an HTML renderer
    render_options = [hard_wrap: true]
    renderer ||= Redcarpet::Render::HTML.new(*render_options)
    
    # Initializes a Markdown parser
    extensions = [space_after_headers: true]
    parser ||= Redcarpet::Markdown.new(renderer, *extensions)
    
    # Renders the Markdown
    parser.render(text).html_safe
  end  
end
