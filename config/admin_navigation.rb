SimpleNavigation::Configuration.run do |navigation|  
  navigation.items do |primary|
    primary.item :overview, 'Overview', admin_root_path
    primary.item :pages, 'Pages', admin_pages_path
    primary.item :galleries, 'Galleries', admin_galleries_path
    primary.item :categories, 'Categories', admin_categories_path
    primary.item :posts, 'Posts', admin_posts_path
    primary.item :maps, 'Maps', admin_maps_path
    primary.item :maps, 'Users', admin_users_path
    
    primary.item :front, 'Front', root_path
    

    primary.item :logout, 'Logout', destroy_admin_session_path
  end
end