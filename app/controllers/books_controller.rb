class BooksController < ApplicationController
  def books_search
    @books = []
    @title = params[:keyword]
    if @title.present?
      # 楽天APIから検索取得したデータ（jsonデータ）
      results = RakutenWebService::Books::Book.search({
        title: @title,
      })
      # APIからの取得したJSONデータを格納
      results.each do |result|
        book = Book.new(read(result))
        @books << book
      end
    end
    # 個別に保存。保存済みは除外
    @books.each do |book|
      unless Book.all.include?(book)
        book.save
      end
    end
  end

  private

  def read(result)
    title = result["title"]
    author = result["author"]
    url = result["itemUrl"]
    isbn = result["isbn"]
    image_url = result["mediumImageUrl"].gsub('?_ex=50x50', '')
    item_caption = result["itemCaption"]
    {
      title: title,
      author: author,
      url: url,
      isbn: isbn,
      image_url: image_url,
      item_caption: item_caption,
    }
  end
end
