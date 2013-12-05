# == Schema Information
#
# Table name: tipo_contribuyentes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class TipoContribuyente < ActiveRecord::Base

  has_many :clients
end
