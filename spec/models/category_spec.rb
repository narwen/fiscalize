require 'spec_helper'

describe Category do

  describe "slug=" do
    context "slug without /" do
      it "should add /" do
        subject.slug = "url"
        subject.slug.should == "/url"
        subject.save
      end
    end

    context "slug with /" do
      it "should not add /" do 
       subject.slug = "/url"
       subject.slug.should == "/url"
       subject.save
      end
    end
  end

end
