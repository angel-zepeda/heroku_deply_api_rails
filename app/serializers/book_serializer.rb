class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :author
  # belongs_to :author
end
