require 'spec_helper'

describe "Client" do

  subject { page }
  before do
      sign_in_as_a_valid_user
  end

  describe "create new page" do
    before { visit new_client_path }
    it { should have_content('Crear Cliente Nuevo') }
    it { should have_title(full_title('Crear Cliente')) }
  end

  describe "register client" do
    before { visit new_client_path }
    let(:submit) { "Create Client" }

    describe "with invalid information" do
      it "should not create a client" do
        expect { click_button submit }.to_not change(Client, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "client_name", with: "Example Name"
        fill_in "client_fullname", with: "Example Fullname"
        fill_in "client_ruc", with: "J1234567891112"
        fill_in "client_legalrepresentative", with: "John Example"
        fill_in "client_address", with: "Example Address"
        fill_in "client_web", with: "www.example.com"
      end

      it "should create a new client" do
        expect { click_button submit }.to change(Client, :count).by(1)
      end
    end
  end

end
