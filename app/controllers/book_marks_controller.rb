class BookMarksController < ApplicationController
  def index
    @book_marks = BookMark.all
  end

  def show

  end

  def create
    @book_marks = BookMark.save!(book_mark_create_params)

    respond_to do |format|
      format.json {}
    end
  end

  def update

  end

  def destroy

  end

  private
  def book_mark_id

  end

  def book_mark_create_params

  end

  def book_mark_update_params

  end
end
