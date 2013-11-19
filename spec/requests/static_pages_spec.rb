require 'spec_helper'

describe "StaticPages" do
  subject { page }
  
  describe "Home page" do
    before { visit root_path }

  	it { should have_content('Sistema de Control de Proyectos') }
    it { should have_title(full_title('')) }
    it { should_not have_title('| Home') }
  end

  describe "Help page" do
    before { visit help_path }

		it { should have_content('Ayuda') }
    it { should have_title(full_title('Ayuda')) }
  end

  describe "About page" do
    before { visit about_path }

		it { should have_content('Acerca de Nosotros') }
    it { should have_title(full_title('Acerca de Nosotros')) }
  end
end
