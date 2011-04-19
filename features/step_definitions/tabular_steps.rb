Then /^(?:|I )should see the following table:$/ do |table|
  body = Nokogiri(page.body)
  table.hashes.each_with_index do |hash, row|
    hash.each do |title, value|
      heading = body.xpath("//table//th[starts-with(normalize-space(.), '#{title}')]").first
      unless heading
        heading = body.xpath("//table//th/a[starts-with(normalize-space(.), '#{title}')]").first.try(:parent)
      end
      raise "No such heading: #{title}" unless heading
      column = heading.parent.children.select{|e| e.name == 'th'}.reject(&:blank?).index(heading)
      page.should have_xpath("//tr[#{row+1}]/td[#{column+1}]/descendant-or-self::*[contains(normalize-space(.), '#{value}')]")
    end
  end
end

Then /^I should see a table of (\d+) rows?$/ do |count|
  page.all(:xpath, "//*/table/tbody/tr").size.should == count.to_i
end

Then /^I should see the following select options:$/ do |table|
  table.raw.each_with_index do |element, i|
    page.should have_xpath("//option[#{i+1}][contains(., '#{element.first}')]")
  end
end
