Given(/^the following articles exist$/) do |table|
  table.hashes.each do | a |
    article = Article.create(id: a[:id], title: a[:title], body: a[:body])
    author = User.find_by_login(a[:author])
    author.articles << article
  end
end

Then(/^article "(.*?)" should have body "(.*?)"$/) do |title, body|
  Article.find_by_title(title).body.should eq body
end

Then(/^article "(.*?)" should be owned by "(.*?)"$/) do |title, login|
  Article.find_by_title(title).user.should eq User.find_by_login(login)
end

Then(/^article "(.*?)" should have title "(.*?)"$/) do |title, name|
  Article.find_by_title(title).title.should eq name
end
