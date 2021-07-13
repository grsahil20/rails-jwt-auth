# == Schema Information
#
# Table name: jwt_blacklists
#
#  id         :bigint           not null, primary key
#  jti        :string
#  aud        :string
#  exp        :datetime
#  users_id   :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class JwtBlacklist < ApplicationRecord

  include Devise::JWT::RevocationStrategies::Denylist
  self.table_name = 'jwt_blacklists'

end
