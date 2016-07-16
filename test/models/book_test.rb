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
    @book.title = ""
    assert_not @book.valid?
  end

  test "book title should not be too long" do
    @book.title = "w" * 100
    assert_not @book.valid?
  end

  test "book author should be present" do
    @book.author = ""
    assert_not @book.valid?
  end

  test "book description should be present" do
    @book.description = ""
    assert_not @book.valid?
  end

end
