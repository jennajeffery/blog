require 'page-object'


  class BlogList
    include PageObject

    page_url 'localhost:4567'

    button(:new_blog, id:'new_blog')
    button(:read_blog, id: 'read_blog')

    def first_blog_entry
      @browser.div(id: 'post-0').text
    end

    def blog_list_count
      @browser.elements(:class => 'post').size
    end
  end