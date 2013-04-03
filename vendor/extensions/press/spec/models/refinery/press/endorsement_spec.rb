require 'spec_helper'

module Refinery
  module Press
    describe Endorsement do
      describe "validations" do
        subject do
          FactoryGirl.create(:endorsement,
          :quote => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:quote) { should == "Refinery CMS" }
      end
    end
  end
end
