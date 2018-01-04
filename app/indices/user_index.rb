ThinkingSphinx::Index.define :user, with: :active_record do
  indexes email, sortable: true
  indexes nickname, sortable: true
  indexes fullname, sortable: true
  has created_at
  has last_sign_in_at
end