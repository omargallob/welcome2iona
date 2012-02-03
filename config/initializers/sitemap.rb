DynamicSitemaps::Sitemap.draw do


  url root_url, :last_mod => DateTime.now, :change_freq => 'daily', :priority => 1
  
  Page.main.each do |p|
    url viewer_url(p.name),:last_mod => p.updated_at, :change_freq => 'monthly', :priority => 0.8
    p.subpages do |sub|
      url viewer_sub_url(p.name,sub.name),:last_mod => sub.updated_at, :change_freq => 'monthly', :priority => 0.5
    end   
  end
  Category.main.delete_if{|x| x.id == 10}.each do |c|
    url viewer_index_filtered_posts_url(c.page.name, c.title.gsub(" ","_")),:last_mod => c.updated_at, :change_freq => 'monthly', :priority => 0.8
    c.subcategories.each do |s|
      url viewer_index_subfiltered_posts_url(c.page.name, c.title.gsub(" ","_"),s.title.gsub("/","+")),:last_mod => s.updated_at, :change_freq => 'monthly', :priority => 0.5
    end
  end
  # new_page!
  
  # Product.all.each do |product|
  #   url product_url(product), :last_mod => product.updated_at, :change_freq => 'monthly', :priority => 0.8
  # end

  # new_page!
  
  # autogenerate  :products, :categories,
  #               :last_mod => :updated_at,
  #               :change_freq => 'monthly',
  #               :priority => 0.8
                
  # new_page!
  
  # autogenerate  :users,
  #               :last_mod => :updated_at,
  #               :change_freq => lambda { |user| user.very_active? ? 'weekly' : 'monthly' },
  #               :priority => 0.5
  
end