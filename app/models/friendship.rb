class Friendship < ApplicationRecord
    belongs_to :requester, class_name: 'User', foreign_key: "requester_id"
    belongs_to :receiver, class_name: 'User', foreign_key: "receiver_id"
    after_create :delete_friend_request, :mirror_friendship
    after_destroy :destroy_mirror_friendship

  def delete_friend_request
    @request = FriendRequest.find_by(requester: self.requester_id, 
                                     receiver: self.receiver_id)
    @request.destroy if @request
  end

  def mirror_friendship
    unless Friendship.find_by(requester: self.receiver_id,
                              receiver: self.requester_id)
      Friendship.create(requester: self.receiver,
                        receiver: self.requester)
    end
  end

  def destroy_mirror_friendship
    if Friendship.find_by(requester: self.receiver_id,
                          receiver: self.requester_id)
      Friendship.find_by(requester: self.receiver,
                        receiver: self.requester).destroy 
    end
  end  
end
