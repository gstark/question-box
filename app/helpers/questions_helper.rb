module QuestionsHelper
  def markdownify(text)
    renderer = Redcarpet::Render::HTML.new(
      :filter_html => true,
      :no_links => true,
      :safe_links_only => true,
      :hard_wrap => true)
    markdown = Redcarpet::Markdown.new(renderer, extensions = {})
    
    markdown.render(text.to_s).html_safe
  end
end
