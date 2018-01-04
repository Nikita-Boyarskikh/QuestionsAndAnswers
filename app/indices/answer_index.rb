ThinkingSphinx::Index.define :answer, with: :active_record do
  indexes text
  has created_at
  has rating
end