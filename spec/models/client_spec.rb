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
  before do
    @client = Client.new(name: "Example", fullname: "Example",
              ruc: "J1234567891112", legalrepresentative: "Example Representative",
              address: "Example address", web:"www.Example.com")
  end

  subject { @client }

  it { should respond_to(:name) }    
  it { should respond_to(:fullname) }    
  it { should respond_to(:ruc) }    
  it { should respond_to(:legalrepresentative) }    
  it { should respond_to(:address) }    
  it { should respond_to(:web) }    

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

end
