ActiveAdmin.register Product do

  controller do
    def scoped_collection
      Product.eager_load(:bids)
    end
  end

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :description, :price
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

  index do
    column :id
    column :name
    column :description    
    column :price
    column 'second_prince' do |p|
      p.price * 5
    end

    column 'bids count' do |p|
      p.bids.size
    end
    actions

  end

end
