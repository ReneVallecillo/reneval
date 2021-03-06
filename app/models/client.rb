# == Schema Information
#
# Table name: clients
#
#  id                    :integer          not null, primary key
#  name                  :string(255)
#  fullname              :string(255)
#  ruc                   :string(14)
#  legalrepresentative   :string(255)
#  address               :string(255)
#  web                   :string(255)
#  created_at            :datetime
#  updated_at            :datetime
#  description           :text
#  user_id               :integer
#  segmento_id           :integer
#  tipo_contribuyente_id :integer
#

class Client < ActiveRecord::Base


  validates :name, presence: true, length: { in: 3..25 }, uniqueness: { case_sensitive: false }
  validates :fullname, presence: true
  VALID_RUC_FORMAT = /\A(J|\d){1}[A-Z0-9]{13}$\Z/
  validates :ruc, presence: true, :format => { with: VALID_RUC_FORMAT }
  validates :user_id, presence: true

  #relations
  belongs_to :user
  belongs_to :segmento
  belongs_to :tipo_contribuyente

end
