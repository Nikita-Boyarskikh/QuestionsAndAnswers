ActiveAdmin.register Answer do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :question_id, :author_id, :text, :rating, :is_best
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
# filter :text
# filter :rating
# filter :is_best
# filter :question
# filter :created_at
# filter :updated_at
# filter :author

# Add or remove columns to toggle their visiblity in the index action
# index do
#   selectable_column
#   id_column
#   column :id
#   column :text
#   column :rating
#   column :is_best
#   column :question
#   column :created_at
#   column :updated_at
#   column :author
#   actions
# end

# Add or remove rows to toggle their visiblity in the show action
# show do |answer|
#   row :id
#   row :text
#   row :rating
#   row :is_best
#   row :question
#   row :created_at
#   row :updated_at
#   row :author
# end

# Add or remove fields to toggle their visibility in the form
# form do |f|
#   f.inputs do
#     f.input :text
#     f.input :rating
#     f.input :is_best
#     f.input :question
#     f.input :author
#   end
#   f.actions
# end

end
