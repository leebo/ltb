class Phone
  include Mongoid::Document
  field :imei, :type => String
  field :tel, :type => String
  field :status, :type => Integer
  field :blockNum, :type => String
  field :blockStr, :type => String
  field :create_at, :type => Time, :default => Time.now
  embeds_many :messages
end
