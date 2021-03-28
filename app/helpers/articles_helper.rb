module ArticlesHelper
  def file_name(article)
    full_file_name = rails_blob_path(article.letter)
    content_type = File.extname(full_file_name).to_s
    file_name = article.letter.filename.to_s
    file_name.delete!(content_type)
  end

  def file_size(article)
    (article.letter.blob.byte_size / 1000).to_s + 'KB'
  end
end
