require 'YAML'

namespace :lessons do

  desc 'loads the lessons into the database. FILE env required'
  task :load => :environment do
    file_path = ENV["FILE"]
    raise "Set FILE env to the location of the file to load e.g. FILE=lib/lessons.yaml" unless file_path
    puts "Loading from #{file_path}"
    lessons = YAML::load(File.open(RAILS_ROOT + '/' + file_path))
    lessons.each do |l|
      lesson = Lesson.create(
        :title => l["title"],
        :detail => l["detail"],
        :link => l["link"]
      )
      puts "Created: #{lesson.inspect}"
    end
  end

end
