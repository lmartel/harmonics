# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Auditions" do
    describe "Admin" do
      describe "auditions" do
        login_refinery_user

        describe "auditions list" do
          before do
            FactoryGirl.create(:audition, :firstname => "UniqueTitleOne")
            FactoryGirl.create(:audition, :firstname => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.auditions_admin_auditions_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.auditions_admin_auditions_path

            click_link "Add New Audition"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Firstname", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Auditions::Audition.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Firstname can't be blank")
              Refinery::Auditions::Audition.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:audition, :firstname => "UniqueTitle") }

            it "should fail" do
              visit refinery.auditions_admin_auditions_path

              click_link "Add New Audition"

              fill_in "Firstname", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Auditions::Audition.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:audition, :firstname => "A firstname") }

          it "should succeed" do
            visit refinery.auditions_admin_auditions_path

            within ".actions" do
              click_link "Edit this audition"
            end

            fill_in "Firstname", :with => "A different firstname"
            click_button "Save"

            page.should have_content("'A different firstname' was successfully updated.")
            page.should have_no_content("A firstname")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:audition, :firstname => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.auditions_admin_auditions_path

            click_link "Remove this audition forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Auditions::Audition.count.should == 0
          end
        end

      end
    end
  end
end
