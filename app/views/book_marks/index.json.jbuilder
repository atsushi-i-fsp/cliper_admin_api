json.array!(@book_marks) do |book_mark|
  json.extract! book_mark, :id, :title, :url, :body
end
