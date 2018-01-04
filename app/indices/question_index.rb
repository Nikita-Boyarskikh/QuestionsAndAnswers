ThinkingSphinx::Index.define :question, with: :active_record do
  indexes title, sortable: true
  indexes text
  has created_at
  has rating
end