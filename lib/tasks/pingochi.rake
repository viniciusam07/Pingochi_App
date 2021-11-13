namespace :pingochi do
  desc "Set age to all pingochis"
  task update_age: :environment do
    Pingochi.all.each do |pingochi|
      if pingochi.age < 10
        pingochi.age += 1
      else
        pingochi.live = false
      end
    pingochi.save!
    end
  end
end
