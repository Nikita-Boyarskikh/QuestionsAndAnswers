class Permission < ApplicationRecord
  def check_for_subject(subject)
    subject.nil? || subject_id.nil? || subject_id == subject.id
  end
end
