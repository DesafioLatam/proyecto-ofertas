ActiveAdmin.register User do

  controller do 
    def update
      if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].delete("password")
        params[:user].delete("password_confirmation")
      end
      super
    end
  end 

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :email, :password, :password_confirmation, :role
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

  form do |f|
    f.inputs 'Formulario de usuario' do
      f.input :email
      f.input :password
      f.input :password_confirmation
      #f.input :role, as: :select, collection: [["guest", 0], ["user", 1], ["seller", 2]]
      f.input :role, as: :select, collection: User.roles.keys
    end
    f.actions
  end

  index do
    column :email
    column :role
    actions
  end


end

class InetInput < Formtastic::Inputs::StringInput
end
