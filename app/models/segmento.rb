# == Schema Information
#
# Table name: segmentos
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Segmento < ActiveRecord::Base

  has_many :clients
end
