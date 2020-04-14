json.members @members do |member|
  json.id member.id
  json.name member.name
  json.short_url member.short_url
  json.number_of_friends member.friends.count
end