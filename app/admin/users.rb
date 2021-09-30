ActiveAdmin.register User do
  permit_params do
    permit = [:email, :password, :password_confirmation, :fullname, :nickname, :birthday, ]
    ability = Ability.new(current_user)
    ability.can?(:manage, :user) ? permit : []
  end

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :fullname
      f.input :nickname
      f.input :birthday
    end
    f.actions
  end

end
