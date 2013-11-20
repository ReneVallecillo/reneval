# == Schema Information
#
# Table name: clients
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  fullname            :string(255)
#  ruc                 :string(14)
#  legalrepresentative :string(255)
#  address             :string(255)
#  web                 :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#

require 'spec_helper'

describe Client do
  pending "add some examples to (or delete) #{__FILE__}"
end
