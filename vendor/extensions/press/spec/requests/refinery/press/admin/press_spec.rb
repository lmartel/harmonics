# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Press" do
    describe "Admin" do
      describe "press" do
        login_refinery_user

        describe "press list" do
          before do
            FactoryGirl.create(:endorsement, :quote => "UniqueTitleOne")
            FactoryGirl.create(:endorsement, :quote => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.press_admin_press_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.press_admin_press_path

            click_link "Add New Endorsement"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Quote", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Press::Endorsement.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Quote can't be blank")
              Refinery::Press::Endorsement.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:endorsement, :quote => "UniqueTitle") }

            it "should fail" do
              visit refinery.press_admin_press_path

              click_link "Add New Endorsement"

              fill_in "Quote", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Press::Endorsement.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:endorsement, :quote => "A quote") }

          it "should succeed" do
            visit refinery.press_admin_press_path

            within ".actions" do
              click_link "Edit this endorsement"
            end

            fill_in "Quote", :with => "A different quote"
            click_button "Save"

            page.should have_content("'A different quote' was successfully updated.")
            page.should have_no_content("A quote")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:endorsement, :quote => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.press_admin_press_path

            click_link "Remove this endorsement forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Press::Endorsement.count.should == 0
          end
        end

      end
    end
  end
end
