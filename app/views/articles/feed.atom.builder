atom_feed do |feed|
  feed.title( "Offical News From Sam Raines Music" )

  latest_article = @articles.sort_by(&:updated_at).last
  feed.updated( latest_article && latest_article.updated_at )

  @articles.each do |article|
    feed.entry(article) do |entry|
      entry.title( latest_article.created_at.to_date )
      entry.content( article.content, :type => :html )
      entry.author { |author| author.name( "Samuel Raines" ) }
    end
  end
end
