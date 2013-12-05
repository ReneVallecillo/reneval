# == Schema Information
#
# Table name: tipo_contribuyentes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe TipoContribuyente do
  it { should respond_to(:name) }

  it { should respond_to(:clients) }
end
