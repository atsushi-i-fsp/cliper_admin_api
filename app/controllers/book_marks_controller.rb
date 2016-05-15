class BookMarksController < ApplicationController
  before_action :set_book_mark, only: [:show, :update, :destroy]

  def index
    @book_marks = BookMark.all
  end

  def show

  end

  def create
    if params[:method] == 'DELETE'
      @book_mark = BookMark.find(params[:id])
      @book_mark.destroy
      respond_to do |format|
        format.json {
          return render json: {}
        }
      end
    else
      @book_mark = BookMark.new(book_mark_create_params)
      @book_mark.url = 'test'

      respond_to do |format|
        @book_mark.save
        format.json {
          return render json: { id: @book_mark.id }
        }
      end
    end
  end

  def update
    @book_mark.update(test_params)
  end

  def destroy
    @book_mark.destroy
    respond_to do |format|
      format.json {}
    end
  end

  private

  def set_book_mark
    @book_mark = BookMark.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def book_mark_params
    params.fetch(:book_mark, {})
  end

  def book_mark_create_params
    params.require(:book_mark).permit(:title, :body)
  end
end
