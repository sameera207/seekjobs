describe "job with no salary scale, no city, with logo" do
html =<<EOF
<dl class="l-clearfix">
        <dd>
            <h2>
                <a href="/Job/experienced-ruby-on-rails-developer-leading-player-in-the-online-space/in/brisbane-brisbane/23839791">Experienced <span class="highlight">Ruby</span> on Rails Developer - leading player in the online space</a>
                
                <em>Michael Page Technology</em>
            </h2>
            
            
                <ul>
                    
                        <li>Top tier environment where a forward thinking mindset is encouraged and rewarded</li>
                    
                        <li>Excellent scope for growth and exposure to the very latest technologies</li>
                    
                </ul>
            
            
            <p>Provision of bespoke <span class="highlight">Ruby</span> on Rails web application development</p>
            <div class="state-fixedtobase">  
                <div>
                            <span>&gt;</span>
                            <span class="mod-classifiers">Information &amp; Communication Technology</span>
                    
                            <span>&gt;</span>
                            <span class="mod-classifiers">Developers/Programmers</span>
                    </div>

                
<a data-complete-text="&lt;i class='ico ico-18 ico-shortlisted'&gt;&lt;/i&gt;Shortlisted" data-target="#lightboxModal" class="mod-shortlist is-shortlist-button modals" href="#" id="saveJob23839791">
    <i class="ico ico-18 ico-shortlist"></i>Add to shortlist
</a>

<script type="text/javascript">
//&lt;![CDATA[
    $().ready(function(e) {
        $('#saveJob23839791')[0].jobId = 23839791;
    })
//]]&gt;
</script>
                
            </div>
        </dd>
        
        <dd class="state-has-logo">
            <small>12:49 PM</small>

            
            <span>Brisbane</span>
            
            
        </dd>
    </dl>
EOF

  before(:each) do
    @reader = SeekJobReader.new
    @reader.html = html
  end
  
  it "should get the city as Brisbane" do
    @reader.city.should == "Brisbane"
  end
  
  it "should get the posted date" do
    time = Time.new
    @reader.job_posted_date.should == Time.new(time.year,time.month,time.day, 12,49,0)  
  end
  
  it "should get the title as Ruby on Rails Developer" do
    @reader.job_title.should == "Experienced Ruby on Rails Developer - leading player in the online space" 
  end
  
  it "should get the job advert link" do
    @reader.job_advert_link.should == "/Job/experienced-ruby-on-rails-developer-leading-player-in-the-online-space/in/brisbane-brisbane/23839791"  
  end
  
  it "it should get the pay range" do
    @reader.pay_range.should == [0, 0]
  end
  
  it "it should get the seek job id" do
    @reader.seek_job_id == "23839791"
  end

end