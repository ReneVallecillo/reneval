require 'spec_helper'

describe "StaticPages" do
  
  describe "Home page" do
  	it "should have the content 'Sistema de Control de Proyectos'" do 
  		visit '/static_pages/home'
  		expect(page).to have_content('Sistema de Control de Proyectos')
  	end
  	it "should have the title 'Home'" do
      visit '/static_pages/home'
      expect(page).to have_title("René Vallecillo & Consultores | Home")
    end
  end

  describe "Help page" do
  	it "should have the content 'Ayuda'" do 
  		visit '/static_pages/help'
  		expect(page).to have_content('Ayuda')
  	end
  	it "should have the title 'Ayuda'" do
      visit '/static_pages/help'
      expect(page).to have_title("René Vallecillo & Consultores | Ayuda")
    end
  end

  describe "About page" do
  	it "should have the content 'Acerca de Nosotros'" do 
  		visit '/static_pages/about'
  		expect(page).to have_content('Acerca de Nosotros')
  	end

  	it "should have the title 'Acerca de Nosotros'" do
      visit '/static_pages/about'
      expect(page).to have_title("René Vallecillo & Consultores | Acerca de Nosotros")
    end
  end
end
