require 'test_helper'

class TagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tag = tags(:one)
  end

  test 'should get index' do
    get tags_url
    assert_response :success
  end

  test 'should create tag' do
    assert_difference('Tag.count') do
      post tags_url format: :json, params: { tag: { title: 'NewTag' } }
    end
  end

  test 'should show tag' do
    get tag_url(@tag)
    assert_response :success
  end
end
