describe "job with no salary scale, no city, with logo" do
html =<<EOF
<dl class="l-clearfix">
        <dd>
            <h2>
                <a href="/Job/ruby-on-rails-developer/in/act-act/23836575"><span class="highlight">Ruby</span> on Rails Developer</a>
                
                <em>Hays Information Technology</em>
            </h2>
            
            
                <ul>
                    
                        <li>Great team environment</li>
                    
                        <li>Exciting program of work</li>
                    
                        <li>Attractive remuneration</li>
                    
                </ul>
            
            
            <p>This Canberra based organisation is seeking a talented <span class="highlight">Ruby</span> on Rails Programmer to join their passionate team. This role will involve the design, ...</p>
            <div class="state-fixedtobase">  
                <div>
                            <span>&gt;</span>
                            <span class="mod-classifiers">Information &amp; Communication Technology</span>
                    
                            <span>&gt;</span>
                            <span class="mod-classifiers">Engineering - Software</span>
                    </div>

                
<a data-complete-text="&lt;i class='ico ico-18 ico-shortlisted'&gt;&lt;/i&gt;Shortlisted" data-target="#lightboxModal" class="mod-shortlist is-shortlist-button modals" href="#" id="saveJob23836575">
    <i class="ico ico-18 ico-shortlist"></i>Add to shortlist
</a>

<script type="text/javascript">
//&lt;![CDATA[
    $().ready(function(e) {
        $('#saveJob23836575')[0].jobId = 23836575;
    })
//]]&gt;
</script>
                
            </div>
        </dd>
        
        <dd class="state-has-logo">
            <small>Thu 17 Jan</small>

            
            <span>ACT</span>
            
            
        </dd>
    </dl>
EOF

  before(:each) do
    @reader = SeekJobReader.new
    @reader.html = html
  end
  
  it "should get the city as nothing" do
    @reader.city.should == "ACT"
  end
  
  it "should get the posted date" do
    @reader.job_posted_date.should == Date.new(2013,1,17)  
  end
  
  it "should get the title as Ruby on Rails Developer" do
    @reader.job_title.should == "Ruby on Rails Developer" 
  end
  
  it "should get the job advert link" do
    @reader.job_advert_link.should == "/Job/ruby-on-rails-developer/in/act-act/23836575"  
  end

  it "it should get the pay range" do
    @reader.pay_range.should == [0, 0]
  end
  
  it "it should get the seek job id" do
    @reader.seek_job_id == "23836575"
  end
  
end