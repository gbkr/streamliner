namespace :streamliner do
  desc 'Display unused controllers'
  task :report => :environment do
    puts Rails.cache.fetch(:controller_counter)
  end
end
