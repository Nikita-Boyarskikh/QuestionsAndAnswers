ActiveAdmin.register Role do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

# Limit actions available to your users by adding them to the 'except' array
# actions :all, except: []

# Add or remove filters (you can use any ActiveRecord scope) to toggle their
# visibility in the sidebar
# filter :id
# filter :name
# filter :resource_type
# filter :resource
# filter :created_at
# filter :updated_at

# Add or remove columns to toggle their visiblity in the index action
# index do
#   selectable_column
#   id_column
#   column :id
#   column :name
#   column :resource_type
#   column :resource
#   column :created_at
#   column :updated_at
#   actions
# end

# Add or remove rows to toggle their visiblity in the show action
# show do |role|
#   row :id
#   row :name
#   row :resource_type
#   row :resource
#   row :created_at
#   row :updated_at
# end

# Add or remove fields to toggle their visibility in the form
# form do |f|
#   f.inputs do
#     f.input :name
#     f.input :resource_type
#     f.input :resource
#   end
#   f.actions
# end

end
