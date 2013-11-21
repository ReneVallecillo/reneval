require 'spec_helper'

describe "Client" do
  subject { page }
  describe "create new page" do
    before { visit clients_new_path }
    it { should have_content('Crear Cliente Nuevo') }
    it { should have_title(full_title('Crear Cliente')) }
  end
end
