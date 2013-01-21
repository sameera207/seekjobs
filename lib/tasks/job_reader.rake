namespace :SEEK_JOB_READER do
    desc "reading jobs"
    task :read_jobs  => :environment do
      categories = Category.all
      
      categories.each do |category|
        (1..5).each do |i|
          SeekJobReader.new.read_jobs(i, category.name) 
        end  
      end
      
      
      
    end
end