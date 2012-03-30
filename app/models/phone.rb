class Phone
  include Mongoid::Document
 include Mongoid::Timestamps::Created
  field :imei, :type => String
  field :tel, :type => String
  field :status, :type => Integer
  field :blockNum, :type => String
  field :blockStr, :type => String
  embeds_many :messages
end
