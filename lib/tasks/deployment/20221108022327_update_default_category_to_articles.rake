namespace :after_party do
  desc 'Deployment task: update_default_category_to_articles'
  task update_default_category_to_articles: :environment do
    puts "Running deploy task 'update_default_category_to_articles'"

    Article.where(category_id: nil).update_all(category_id: Category.first.id)

    AfterParty::TaskRecord
      .create version: AfterParty::TaskRecorder.new(__FILE__).timestamp
  end
end
