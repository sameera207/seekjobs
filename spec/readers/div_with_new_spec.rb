describe "date new" do
html =<<EOF
<dl class="l-clearfix">
        <dd>
            <h2>
                <a href="/Job/ruby-on-rails-engineers-expression-of-interest-display-advertising-sydney/in/sydney-cbd-inner-west-eastern-suburbs/23843285"><span class="highlight">RUBY</span> ON RAILS Engineers | Expression of Interest | Display Advertising |Sydney</a>
                
                <em>Mosaic Recruitment</em>
            </h2>
            
            
            
            <p><span class="highlight">RUBY</span> ON RAILS Engineers STOP looking</p>
            <div class="state-fixedtobase">  
                <div>
                            <span>&gt;</span>
                            <span class="mod-classifiers">Information &amp; Communication Technology</span>
                    
                            <span>&gt;</span>
                            <span class="mod-classifiers">Developers/Programmers</span>
                    </div>

                
<a data-complete-text="&lt;i class='ico ico-18 ico-shortlisted'&gt;&lt;/i&gt;Shortlisted" data-target="#lightboxModal" class="mod-shortlist is-shortlist-button modals" href="#" id="saveJob23843285">
    <i class="ico ico-18 ico-shortlist"></i>Add to shortlist
</a>

<script type="text/javascript">
//&lt;![CDATA[
    $().ready(function(e) {
        $('#saveJob23843285')[0].jobId = 23843285;
    })
//]]&gt;
</script>
                
            </div>
        </dd>
        
        <dd>
            <small>NEW</small>

            
            <span>Sydney</span>
            <span class="has-subarrow">
                <i class="ico ico-14 state-inline ico-subarrow"></i>
                CBD, Inner West &amp; Eastern Suburbs
            </span>
            
            
        </dd>
    </dl>
EOF

  before(:each) do
    @reader = SeekJobReader.new
    @reader.html = html
  end
  
  it "should get the posted date" do
    @reader.job_posted_date.to_s == DateTime.now.to_s  
  end
  
  it "should get the city as Sydney" do
    @reader.city.should == "Sydney"
  end
  
  it "should get the title as RUBY ON RAILS Engineers | Expression of Interest | Display Advertising |Sydney" do
    @reader.job_title.should == "RUBY ON RAILS Engineers | Expression of Interest | Display Advertising |Sydney" 
  end
  
  it "should get the job advert link" do
    @reader.job_advert_link.should == "/Job/ruby-on-rails-engineers-expression-of-interest-display-advertising-sydney/in/sydney-cbd-inner-west-eastern-suburbs/23843285"  
  end
  
  it "it should get the pay range" do
    @reader.pay_range.should == [0, 0]
  end
  
  it "it should get the seek job id" do
    @reader.seek_job_id == "23843285"
  end
  
end