require 'rubygems'
require 'nokogiri'
require 'date'

class SeekJobReader 
  
  attr_accessor :html
  
  def read_jobs(page, job_category)
    page = Nokogiri::HTML(RestClient.get("http://www.seek.com.au/JobSearch?DateRange=31&SearchFrom=quick&Keywords=#{job_category}&nation=3000&page=#{page}&SearchType=Paging"))
    divs = page.css('dl.l-clearfix')
    divs.each do |div|
      @seek_job = SeekJobReader.new
      @seek_job.html = div.to_html
      city_id = City.find_by_name(@seek_job.city).try(:id)
      category_id = Category.find_by_name(job_category).try(:id)
      posted_date = @seek_job.job_posted_date
      title = @seek_job.job_title
      link = @seek_job.job_advert_link
      range = @seek_job.pay_range
      job_id = @seek_job.seek_job_id
      
      unless Job.find_by_seek_id(job_id)
        new_job = Job.new
        #:advert_link, :category_id, :city_id, :pay_heigh, :pay_low, :posted_date, :seek_id, :title
        new_job.advert_link = link
        new_job.category_id = category_id
        new_job.city_id = city_id
        new_job.pay_heigh = range[1]
        new_job.pay_low = range[0]
        new_job.posted_date = posted_date
        new_job.seek_id = job_id
        new_job.title = title
        new_job.save
        p "job #{job_id} - #{job_category} saved"
      else
        p "job #{job_id} - #{job_category} already exist"
      end
      
    end
  end
  
  
  def city
    doc = Nokogiri::HTML(html)
    str = doc.css('.state-has-logo span').text #city with logo
    if str == ""
      str = doc.css('span').text
      objs = str.split(/\n/)
      objs.each do |val|
        str = search_city_name(str)  
      end
      
    end
    str
  end
  
  def job_posted_date
    dte = ""
    str_dt = ""
    doc = Nokogiri::HTML(html)
    str_dt = doc.css('.state-has-logo small').text #date with logo
    str_dt = doc.css('dd small').text if str_dt == "" #date without a logo
    
    if str_dt == "NEW"
      dte = DateTime.now
    else
      begin
        dte = Date.parse(str_dt)
      rescue
        dte = Chronic.parse(str_dt)    
      end    
    end
    dte
  end
  
  def job_title
    doc = Nokogiri::HTML(html)
    title = doc.css('h2 a').text
    title
  end
  
  def seek_job_id
    url = job_advert_link
    url.split("/").last
  end
  
  def pay_range
    range = [0,0]
    doc = Nokogiri::HTML(html)
    price = doc.css('span strong').text
    if price != ""
      amounts = price.gsub("$","").split("-")
      range[0] = amounts[0].gsub(",","").to_i if (amounts && amounts.size > 0) 
      range[1] = amounts[1].gsub(",","").to_i if (amounts && amounts.size == 2)
    end
    range
  end
  
  def job_advert_link
    #http://www.dzone.com/snippets/finding-elements-attributes
    href = ""
    doc = Nokogiri::HTML(html)
    doc = doc.css('h2 a')
    reader = Nokogiri::XML::Reader(doc.to_xml)
    elems = reader.read
    elems.each do |ele|
      if ele.name == "a"
        href = ele.attributes["href"]
      end
    end
    href
  end
 
 
  private
  def search_city_name(text)
     city = ""
     match = text.to_s.match('(Sydney|Melbourne|Brisbane|Perth)')
     if match
       city = match[0]
     end
     city
  end
  
end
