class BooksController < ApplicationController
  before_action :set_book, only: [:edit, :update, :show, :destory]
  before_action :set_user 
  def index
    @books = Book.all
  end

  def show; end

  def new
    if params[:book]
      @book = Books::GetDetail.call(params[:book])
    else
      @book = Book.new
    end
  end

  def create
    @book = Book.create(book_params)
    if @book.save
      if params[:book][:group_ids]&.count > 0
        params[:book][:group_ids].each do |g|
          Recommendation.create(group_id: g, user_id: @book.user.id, book_id: @book.id) 
        end
      end
      redirect_to @book
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def set_book
    @book = Book.includes(membership: [:group]).find(params[:id])
  end
  def book_params
    params.require(:book).permit(:title, :author, :description, :pages, :genre, :user_id, :book_cover, :isbn, group_ids: [])
  end
  def set_user
    @user = User.includes(:groups).first
  end
end
