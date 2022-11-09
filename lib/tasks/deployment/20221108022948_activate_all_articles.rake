namespace :after_party do
  desc 'Deployment task: activate_all_articles'
  task activate_all_articles: :environment do
    puts "Running deploy task 'activate_all_articles'"

    Article.where(active: false).update_all(active: true)

    AfterParty::TaskRecord
      .create version: AfterParty::TaskRecorder.new(__FILE__).timestamp
  end
end
