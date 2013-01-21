describe "pay range" do
html =<<EOF
<dl class="l-clearfix">
        <dd>
            <h2>
                <a href="/Job/2-x-senior-ruby-on-rails-developers-melbourne-cbd-70-120k/in/melbourne-cbd-inner-suburbs/23827996">2 x Senior <span class="highlight">Ruby</span> on Rails Developers, Melbourne CBD $70-120K</a>
                
                <em>inDmand Career Solutions</em>
            </h2>
            
            
            
            <p>Fantastic Melbourne based software house offering great career prospects have 2 senior roles open in the <span class="highlight">Ruby</span> On Rails space.</p>
            <div class="state-fixedtobase">  
                <div>
                            <span>&gt;</span>
                            <span class="mod-classifiers">Information &amp; Communication Technology</span>
                    
                            <span>&gt;</span>
                            <span class="mod-classifiers">Developers/Programmers</span>
                    </div>

                
<a data-complete-text="&lt;i class='ico ico-18 ico-shortlisted'&gt;&lt;/i&gt;Shortlisted" data-target="#lightboxModal" class="mod-shortlist is-shortlist-button modals" href="#" id="saveJob23827996">
    <i class="ico ico-18 ico-shortlist"></i>Add to shortlist
</a>

<script type="text/javascript">
//&lt;![CDATA[
    $().ready(function(e) {
        $('#saveJob23827996')[0].jobId = 23827996;
    })
//]]&gt;
</script>
                
            </div>
        </dd>
        
        <dd>
            <small>Wed 16 Jan</small>

            <span><strong>$80,000 - $119,999</strong></span>
            <span>Melbourne</span>
            <span class="has-subarrow">
                <i class="ico ico-14 state-inline ico-subarrow"></i>
                CBD &amp; Inner Suburbs
            </span>
            
            
        </dd>
    </dl>
EOF

before(:each) do
  @reader = SeekJobReader.new
  @reader.html = html
end

  it "it should get the pay range" do
    @reader.pay_range.should == [80000, 119999]
  end
  
  it "should get the posted date" do
    @reader.job_posted_date.to_s == Date.new(2013,1,16)    
  end
  
  it "should get the city as Melbourne" do
    @reader.city.should == "Melbourne"
  end
  
  it "should get the title as 2 x Senior Ruby on Rails Developers, Melbourne CBD $70-120K" do
    @reader.job_title.should == "2 x Senior Ruby on Rails Developers, Melbourne CBD $70-120K" 
  end
  
  it "should get the job advert link" do
    @reader.job_advert_link.should == "/Job/2-x-senior-ruby-on-rails-developers-melbourne-cbd-70-120k/in/melbourne-cbd-inner-suburbs/23827996"  
  end
  
  it "it should get the seek job id" do
    @reader.seek_job_id == "23827996"
  end
  
end