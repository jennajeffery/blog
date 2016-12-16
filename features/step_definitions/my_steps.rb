require 'page-object'
require 'faker'

include PageObject::PageFactory

When(/^I add a new blog entry$/) do
  visit_page(BlogList)
  on BlogList do |page|
    page.new_blog
  end
    on BlogEntry do |page|
      page.author = Faker::Name.name
      page.title = Faker::Book.title
      page.textarea = Faker::Lorem.paragraph
      page.fulltext = Faker::Lorem.paragraph(3)
      page.save
  end
end

Then(/^blog post shows at the top of the list$/) do
  on_page(BlogList) do |page|
    first_blog_entry = page.first_blog_entry
    #expect(first_blog_entry).to include Faker::Name.name
    expect(first_blog_entry).to include page.title
    #expect(first_blog_entry).to include Faker::Lorem.paragraph
  end
end

When(/^displaying blog posts$/) do
  visit_page(BlogList)
  on BlogList do |page|
    page.new_blog
  end
  on BlogEntry do |page|
    page.author = Faker::Name.name
    page.title = Faker::Book.title
    page.textarea = Faker::Lorem.paragraph
    page.fulltext = Faker::Lorem.paragraph(3)
    page.save
  end
  visit_page(BlogList)
end

Then(/^only the previous 10 should display$/) do
  on_page(BlogList) do |page|
    expect(page.blog_list_count).to be <= 10
  end
end

When(/^I select a blog post from the list$/) do
  visit_page(BlogList)
  on BlogList do |page|
    page.new_blog
  end
  on BlogEntry do |page|
    page.author = Faker::Name.name
    page.title = Faker::Book.title
    page.textarea = Faker::Lorem.paragraph
    page.fulltext = Faker::Lorem.paragraph(3)
    page.save
  end
  visit_page(BlogList) do
    on BlogList do |page|
    page.read_blog
    end
  end
end

Then(/^I will be able to read the whole blog post body$/) do
  on_page(FullBlogPost) do |page|
    expect(page.full_blog).to eq 1
  end
end






When(/^I make a duplicate blog entry$/) do
  pending
  visit_page(BlogList)
  on BlogList do |page|
    page.new_blog
  end
  on BlogEntry do |page|
    page.author = Faker::Name.name
    page.title = Faker::Book.title
    page.textarea = Faker::Lorem.paragraph
    page.save
  end
  end

Then (/^I get an error message$/) do
  on Error do |page|
    expect(page.text).to include 'Blog entry already exists'
  end
  end
