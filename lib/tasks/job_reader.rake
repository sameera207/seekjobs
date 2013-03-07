namespace :SEEK_JOB_READER do
    desc "reading jobs"
    task :read_jobs  => :environment do
      categories = Category.all
      pointer = 10
      categories.each do |category|
        (1..10).each do |i|
          page = (pointer - i)
          SeekJobReader.new.read_jobs((pointer - i), category.name) if (page != 0)
        end  
      end
      
      
      
    end
end
