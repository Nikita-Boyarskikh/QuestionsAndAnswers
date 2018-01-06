desc 'Resets all cache counters, exists in models'

task reset_cache_counters: :environment do
  ActiveRecord::Base.connection.execute <<-SQL.squish
    UPDATE questions SET answers_count = (
      SELECT count(1) FROM answers
      WHERE answers.question_id = questions.id
    );
    
    UPDATE questions SET answers_count = (
      SELECT count(1) FROM answers
      WHERE answers.question_id = questions.id
    );
    
    UPDATE users SET answers_count = (
      SELECT count(1) FROM answers
      WHERE answers.author_id = users.id
    ), questions_count = (
      SELECT count(1) FROM questions
      WHERE questions.author_id = users.id
    );
    
    UPDATE tags SET answers_count = (
      SELECT count(1) FROM answers, tags_info
      WHERE answers.id = tags_info.answer_id AND tags.id = tags_info.tag_id
    ), questions_count = (
      SELECT count(1) FROM questions, tags_info
      WHERE questions.id = tags_info.question_id AND tags.id = tags_info.tag_id
    );
  SQL
end