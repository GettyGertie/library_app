require 'test_helper'

class BookTest < ActiveSupport::TestCase
  def setup
    @book = Book.new(title: "book",
                    author: "person",
                    description: "A persons book")
  end

  test "book should be valid"
  test "book should be present" do
    @user.title = ""
    assert @book.nil?
  end
end
