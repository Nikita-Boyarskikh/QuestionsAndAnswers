require 'test_helper'

class AnswersControllerTest < ActionDispatch::IntegrationTest
  include Rails.application.routes.url_helpers

  setup do
    @answer = answers(:one)
  end

  test 'should get index' do
    get admin_answers_url
    assert_response :success
  end

  test 'should get new' do
    get new_admin_answer_url
    assert_response :success
  end

  test 'should create answer' do
    assert_difference('Answer.count') do
      post admin_answers_url, params: { answer: { author_id: @answer.author_id, question_id: @answer.question_id, text: 'New text' } }
    end

    assert_redirected_to admin_answer_url(Answer.last)
  end

  test 'should show answer' do
    get admin_answer_url(@answer)
    assert_response :success
  end

  test 'should get edit' do
    get edit_admin_answer_url(@answer)
    assert_response :success
  end

  test 'should update answer' do
    patch admin_answer_url(@answer), params: { answer: { author_id: @answer.author_id, question_id: @answer.question_id, text: 'Other text' } }
    assert_redirected_to admin_answer_url(@answer)
  end
end
