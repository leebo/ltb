class Phone
  include Mongoid::Document
  field :imei, :type => String
  field :tel, :type => String
  field :status, :type => Integer
  field :blockNum, :type => String
  field :blockStr, :type => String
end
