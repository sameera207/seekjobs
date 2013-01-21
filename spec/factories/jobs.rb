# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :job do |j|
    j.title "Ruby Developer"
    j.association :city, :factory => :city
    j.association :category, :factory => :category
    posted_date "2013-01-18"
    advert_link "http://seek.com/advert/1234"
    pay_low 10000
    pay_heigh 20000
    seek_id "1234"
  end
end
