ActiveAdmin.register Bid do

  controller do
    def scoped_collection
      Bid.includes(:product, :user)
    end
  end

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :amount, :product_id, :user_id

#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

  index do
    column :id
    column :amount
    column :product do |b| 
      b.product.name
    end
  end

end
