ActiveAdmin.register Client do

  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :name, :fullname, :ruc, :legalrepresentative, :address,
                :web, :description, :user_id, :segmento_id, :tipo_contribuyente_id                   
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
