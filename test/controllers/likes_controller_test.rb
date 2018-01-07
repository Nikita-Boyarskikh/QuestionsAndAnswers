require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @like = likes(:one)
  end

  test 'should create like' do
    assert_difference('Like.count') do
      post likes_url format: :json, params: {
        like: {
          answer_id: @like.answer_id,
          question_id: @like.question_id,
          author_id: @like.author_id,
          like: 1
        }
      }
    end
  end

  test 'should update like' do
    patch like_url(@like, format: :json), params: {
      like: {
        answer_id: @like.answer_id,
        question_id: @like.question_id,
        author_id: @like.author_id
      }
    }
  end
end
