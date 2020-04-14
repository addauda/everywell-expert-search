json.id @member.id
json.name @member.name
json.website @member.website
json.short_url @member.short_url

json.topics @member.topics do |topic|
  json.tag topic.heading_tag
  json.content topic.content
end

json.friends @member.friends do |friend|
  member = Member.find(friend.to_id)
  json.name member.name
  json.short_url member.short_url
end
