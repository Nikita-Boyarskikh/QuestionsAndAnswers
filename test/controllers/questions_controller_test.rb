require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @question = questions(:one)
  end

  test 'should get index' do
    get questions_url
    assert_response :success
  end

  test 'should get new' do
    get new_question_url
    assert_response :success
  end

  test 'should create question' do
    assert_difference('Question.count') do
      post questions_url, params: { question: { author_id: @question.author_id, rating: @question.rating, text: @question.text, title: @question.title } }
    end

    assert_redirected_to question_url(Question.last)
  end

  test 'should show question' do
    get question_url(@question)
    assert_response :success
  end

  test 'should get edit' do
    get edit_question_url(@question)
    assert_response :success
  end

  test 'should update question' do
    patch question_url(@question), params: { question: { author_id: @question.author_id, rating: @question.rating, tag_ids: @question.tag_ids, text: @question.text, title: @question.title } }
    assert_redirected_to question_url(@question)
  end
end
