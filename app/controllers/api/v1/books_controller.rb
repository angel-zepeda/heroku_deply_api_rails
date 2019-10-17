class Api::V1::BooksController < ApplicationController
    def index
        books = Book.all 
        render json: books
    end

    def create
        book = Book.create(book_params)
        if book.save
            render json: {
                code: 200,
                message: "Book created",
                data: book
            }, status: 200
        else 
            render json: {
                code: 500,
                message: "Book cant be created #{book.erros}",
            }, status: 500
        end
    end 

    private 
        def book_params
            params.permit(:title, :description, :author_id)
        end
end