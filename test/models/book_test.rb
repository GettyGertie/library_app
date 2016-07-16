require 'test_helper'

class BookTest < ActiveSupport::TestCase
  def setup
    @book = Book.new(title: "book",
                    author: "person",
                    description: "A persons book")
  end

  test "book should be valid" do
    assert @book.valid?
  end

  test "book title should be present" do
    @user.title = ""
    assert @book.valid?
  end

  test "book author should be present" do
    @user.title = ""
    assert @book.valid?
  end

  test "book should be present" do
    @user.title = ""
    assert @book.valid?
  end
end
