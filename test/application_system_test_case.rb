require "test_helper"
require '../app/helpers/sphinx_helper'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include SphinxHelper

  self.use_transactional_tests = true
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]

  setup do
    ThinkingSphinx::Test.init
    ThinkingSphinx::Test.start index: false
    index
  end

  teardown do
    ThinkingSphinx::Test.stop
    ThinkingSphinx::Test.clear
  end
end
