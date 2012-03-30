class Message
  include Mongoid::Document
  field :tel, :type => String
  field :context, :type => String
end
