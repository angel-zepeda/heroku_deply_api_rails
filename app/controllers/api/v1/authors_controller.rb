class Api::V1::AuthorsController < ApplicationController
    def index
        authors = Author.all
        render json: authors
    end

    def create
        author = Author.create(author_params)
        if author.save
            render json: {
                code: 200,
                message: 'Author created',
                data: author
            }, status: 200
        else
            render json: {
                code: 500,
                message: "Cannot create author #{author.errors.full_messages}"
            }, status: :bad
        end
    end

    def delete
        author = Author.find(params[:id])
        if author.destroy
            render json: {
                code: 200,
                message: "Author deleted"
            }
        else
            render json: {
                code: 500,
                message: "Cannot delete author #{author.errors.full_messages}"
            } 
        end 
    end 

    private
        def author_params
            params.permit(:name, :age)
        end
end 