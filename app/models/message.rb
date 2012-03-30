class Message
  include Mongoid::Document
  field :tel, :type => String
  field :context, :type => String
  field :create_at, :type => Time, :default => Time.now
  embedded_in :phone
end
