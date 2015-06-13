namespace :streamliner do
  desc 'Reset controller usage count'
  task :reset => :environment do
    Rails.cache.delete(:controller_counter)
    puts "Controller usage count reset.\n"
  end
end
