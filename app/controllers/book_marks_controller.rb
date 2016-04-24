class BookMarksController < ApplicationController
  before_action :set_book_mark, only: [:show, :update, :destroy]

  def index
    @book_marks = BookMark.all
  end

  def show

  end

  def create
    @book_marks = BookMark.new(book_mark_create_params)

    respond_to do |format|
      @book_mark.save
      format.json {}
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
end
