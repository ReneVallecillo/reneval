require 'spec_helper'

describe "UserPages" do
  subject { page }

  describe "signup page " do
    before{ visit new_user_registration_path }

    it { should have_content('Registrate') }
    it { should have_title(full_title('Registro')) }
  end

end
