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

require 'spec_helper'

describe Client do

  let(:user) { FactoryGirl.create(:user) }
  let(:segmento) { FactoryGirl.create(:segmento) }
  let(:tipo_contribuyente) { FactoryGirl.create(:tipo_contribuyente) }

  before do
    @client = user.clients.build(name: "Example", fullname: "Example",
              ruc: "J1234567891112", legalrepresentative: "Example Representative",
              address: "Example address", web:"www.Example.com", segmento_id: segmento.id,
              tipo_contribuyente_id: tipo_contribuyente.id)
  end

  subject { @client }

  it { should respond_to(:name) }    
  it { should respond_to(:fullname) }    
  it { should respond_to(:ruc) }    
  it { should respond_to(:legalrepresentative) }    
  it { should respond_to(:address) }    
  it { should respond_to(:web) }
  

  #relations
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }
  it { should respond_to(:segmento) }    
  it { should respond_to(:tipo_contribuyente) }    

  it { should be_valid }

  describe "when name is not present" do
    before { @client.name = " " }
    it { should_not be_valid }
  end


  describe "when fullname is not present" do
    before { @client.fullname = " " }
    it { should_not be_valid }
  end

  describe "when ruc is not present" do
    before { @client.ruc = " " }
    it { should_not be_valid }
  end

  describe "when name is too short" do
    before { @client.name = "ab" }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @client.name = "a"*26 }
    it { should_not be_valid }
  end

  describe "when name is already taken" do
    before do
      client_with_same_name = @client.dup
      client_with_same_name.name = @client.name.upcase
      client_with_same_name.save
    end

    it { should_not be_valid }
  end

  describe "when RUC format is invalid" do
    it "should be invalid" do
      rucs = %w[j1234567891011 j123456789 h1234567891112 123456789001112
        1234567890222222]
      rucs.each do |invalid_ruc|
        @client.ruc = invalid_ruc
        expect(@client).not_to be_valid
      end      
    end
  end

  describe "when RUC format is valid" do
    it "should be valid" do
      rucs = %w[J1234567891011 J1211987654321 0012311840018C]
      rucs.each do |invalid_ruc|
        @client.ruc = invalid_ruc
        expect(@client).to be_valid
      end      
    end
  end

  describe "when user_id is not present" do
    before { @client.user_id = nil }
    it { should_not be_valid }
  end

end
