require 'page-object'

class BlogEntry
  include PageObject

  text_field(:author, :name =>'author')
  text_field(:title, :name =>'title')
  text_field(:textarea, :name =>'textarea')
  text_field(:fulltext, :name =>'fulltext')
  button(:save, :id =>'submit')
end