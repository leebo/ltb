class Message
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  field :tel, :type => String
  field :context, :type => String
  embedded_in :phone
end
