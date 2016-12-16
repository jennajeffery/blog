require 'page-object'


class FullBlogPost
  include PageObject

  text_field(:author, :name =>'author')
  text_field(:title, :name =>'title')
  text_field(:textarea, :name =>'textarea')
  text_field(:fulltext, :name =>'fulltext')

  def full_blog
    @browser.elements(:class => 'post').size
  end
end
