require 'redcarpet'

class Article < ApplicationRecord
  before_save :assign_markdown_content

  def assign_markdown_content
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    assign_attributes(markdown_content: markdown.render(content))
  end
end
