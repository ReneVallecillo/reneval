def full_title(page_title)
  base_title = "René Vallecillo & Consultores"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
end