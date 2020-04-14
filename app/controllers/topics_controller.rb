class TopicsController < ApplicationController
  def search
    @results = []
    # get friends for member that is searching
    friends = get_friends(topic_params[:id])

    # get a list of members that are not known
    strangers =
      Member.select(:id, :name).where.not(id: friends).where.not(
        id: topic_params[:id].to_i
      )

    # find which members from unknown list have expertise on the topic being queried
    experts = get_members_for_topic(strangers, params[:query])

    experts.each do |expert|
      search_result = {
        member_id: expert.member_id,
        topic: expert.content,
        short_url: expert.short_url,
        path: []
      }

      # check to see member that is searching has mutual friends with the topic expert
      mutual = check_mutual(friends, expert.member_id)

      # add to topic connection path
      if !mutual.empty?
        search_result[:path].push(
          topic_params[:id].to_i,
          mutual.first.to_id,
          expert.member_id
        )
      end

      @results.push(search_result)
    end
  end

  def check_mutual(friends, stranger_id)
    friends_of_stranger = get_friends(stranger_id)
    mutual_friends = friends_of_stranger.where(to_id: friends)
  end

  def get_friends(member_id)
    Friend.select(:to_id).where(['from_id = :id', { id: member_id.to_i }])
  end

  def get_members_for_topic(strangers, query_string)
    strangers.select('members.*, topics.*').joins(:topics).where(
      [
        'topics.content like :query_string',
        { query_string: "%#{query_string}%" }
      ]
    )
  end

  def topic_params
    params.permit(:id, :query)
  end
end
