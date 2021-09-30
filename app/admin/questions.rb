ActiveAdmin.register Question do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  permit_params :title, :text, :author_id, :rating
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
# filter :title
# filter :text
# filter :rating
# filter :answers_count
# filter :created_at
# filter :updated_at
# filter :author

# Add or remove columns to toggle their visiblity in the index action
# index do
#   selectable_column
#   id_column
#   column :id
#   column :title
#   column :text
#   column :rating
#   column :answers_count
#   column :created_at
#   column :updated_at
#   column :author
#   actions
# end

# Add or remove rows to toggle their visiblity in the show action
# show do |question|
#   row :id
#   row :title
#   row :text
#   row :rating
#   row :answers_count
#   row :created_at
#   row :updated_at
#   row :author
# end

# Add or remove fields to toggle their visibility in the form
form do |f|
  f.inputs do
    f.input :author
    f.input :title
    f.input :text
  end
  f.actions
end

end
