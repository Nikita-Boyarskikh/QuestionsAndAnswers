ActiveAdmin.register Tag do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :answer_id, :question_id, :title
#
# controller do
#   def index(options={}, &block)
#     # You can put your send email code over here
#     super do |success, failure|
#       block.call(success, failure) if block
#       failure.html { render :edit }
#     end
#   end
# end
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
# filter :questions_count
# filter :answers_count
# filter :created_at
# filter :updated_at

# Add or remove columns to toggle their visiblity in the index action
# index do
#   selectable_column
#   id_column
#   column :id
#   column :title
#   column :questions_count
#   column :answers_count
#   column :created_at
#   column :updated_at
#   actions
# end

# Add or remove rows to toggle their visiblity in the show action
# show do |tag|
#   row :id
#   row :title
#   row :questions_count
#   row :answers_count
#   row :created_at
#   row :updated_at
# end

# Add or remove fields to toggle their visibility in the form
# form do |f|
#   f.inputs do
#     f.input :title
#     f.input :question
#     f.input :answer
#   end
#   f.actions
# end

end
