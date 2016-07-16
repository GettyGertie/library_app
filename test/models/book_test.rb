require 'test_helper'

class BookTest < ActiveSupport::TestCase
  def setup
    @book = Book.new(title: "book",
                    author: "person",
                    description: "A persons book")
  end
end
