class FriendRequest < ApplicationRecord
    belongs_to :requester, class_name: 'User', foreign_key: "request_sender"
    belongs_to :receiver, class_name: 'User', foreign_key: "request_receiver"
    validates :receiver, uniqueness: { scope: :requester }
end
