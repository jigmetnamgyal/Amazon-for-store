module Api
  module V1
    class BooksController < ApplicationController
      before_action :set_book, only: [:show, :update, :destroy]
      before_action :authenticate_store!

      # GET /books
      def index
        @books = Book.all

        render json: @books
      end

      # GET /books/1
      def show
        render json: @book
      end

      # POST /books
      def create
        @book = current_store.books.build(book_params)
        # @book = Book.new(book_params)
        if @book.save
          render json: @book, status: :created, location: api_v1_book_url(@book)
        else
          render json: @book.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /books/1
      def update
        if @book.update(book_params)
          render json: @book
        else
          render json: @book.errors, status: :unprocessable_entity
        end
      end

      # DELETE /books/1
      def destroy
        @book.destroy
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_book
        @book = Book.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def book_params
        params.require(:book).permit(:title, :description, :price, :store_id)
      end
    end

  end
end

