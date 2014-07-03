Given(/^the following users exist$/) do |table|
  User.create table.hashes
end
