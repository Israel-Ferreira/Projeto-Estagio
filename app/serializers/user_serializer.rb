class UserSerializer < Pinkman::Serializer::Base
  
  scope :public do |can|
    can.read_attributes :all
    can.write_attributes false
    can.access_actions :index, :show
  end

  scope :admin do |can|
    can.read_attributes :all
    can.write_attributes :all
    can.access_actions :all
  end

end