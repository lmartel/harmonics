require 'spec_helper'

module Refinery
  module Auditions
    describe Slot do
      describe "validations" do
        subject do
          FactoryGirl.create(:slot)
        end

        it { should be_valid }
        its(:errors) { should be_empty }
      end
    end
  end
end
