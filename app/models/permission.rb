class Permission < ApplicationRecord
  def check_for_subject(subject)
    subject.nil? || permission.subject_id.nil? || permission.subject_id == subject.id
  end
end
