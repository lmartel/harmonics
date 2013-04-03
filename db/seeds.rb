# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Added by Refinery CMS Pages extension
Refinery::Pages::Engine.load_seed

# Added by Refinery CMS Auditions extension
Refinery::Auditions::Engine.load_seed

# Added by Refinery CMS Slots extension
Refinery::Auditions::Engine.load_seed

# Added by Refinery CMS Members extension
Refinery::People::Engine.load_seed

# Added by Refinery CMS Events extension
Refinery::Events::Engine.load_seed

# Added by Refinery CMS Albums extension
Refinery::Albums::Engine.load_seed

# remove slots page (should not exist)
Refinery::Page.find_by_slug("slots").destroy!

# create admin user
if Refinery::User.find_by_username("admin").nil?
  admin = Refinery::User.new(username: "admin", email: "leo@stanfordharmonics.com")
  admin.password = "boost"
  admin.add_role :Refinery
  admin.add_role :superuser
  admin.save!
end

# create hidden announcement page
if Refinery::Page.find_by_slug("announcement").nil?
  announce = Refinery::Page.new(title: "Announcement", deletable: false)
  announce.parent_id = Refinery::Page.find_by_slug("home").id
  announce.show_in_menu = false
  announce.save!
  Refinery::PagePart.create(refinery_page_id: announce.id, title: "Body", body: "")
end

# create hidden sidebar page
if Refinery::Page.find_by_slug("sidebar").nil?
  sidebar = Refinery::Page.new(title: "Sidebar", deletable: false)
  sidebar.parent_id = Refinery::Page.find_by_slug("home").id
  sidebar.show_in_menu = false
  sidebar.save!
  Refinery::PagePart.create(refinery_page_id: sidebar.id, title: "Body", body: "")
end

# create contact page
if Refinery::Page.find_by_slug("contact").nil?
  contact = Refinery::Page.create(title: "Contact", deletable: true)
  Refinery::PagePart.create(refinery_page_id: contact.id, title: "Body", body: "")
end

# populate pages
def add_body_content(slug, content)
  pp = Refinery::PagePart.find_by_refinery_page_id(Refinery::Page.find_by_slug(slug).id)
  pp.body = content
  pp.save!
end

add_body_content("home", "<p>Welcome to our site. This is just a place holder page while we gather our content.</p><p>This is another block of content over here.&#160;Lorem ipsum HOMEPAGE sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia</p>")
add_body_content("page-not-found", "<h1>Oops</h1><p>Clever 404 message here</p>")
add_body_content("announcement", "<h1>Announcement</h1><p>Text goes here</p>")
add_body_content("sidebar", "<h3>SIDEBAR HEADER</h3><p>Lorem ipsum SIDEBAR sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia</p>")
add_body_content("about", "<p>This is just a standard text page example. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin metus dolor, hendrerit sit amet, aliquet nec, posuere sed, purus. Nullam et velit iaculis odio sagittis placerat. Duis metus tellus, pellentesque ut, luctus id, egestas a, lorem. Praesent vitae mauris. Aliquam sed nulla. Sed id nunc vitae leo suscipit viverra. Proin at leo ut lacus consequat rhoncus. In hac habitasse platea dictumst. Nunc quis tortor sed libero hendrerit dapibus. Integer interdum purus id erat. Duis nec velit vitae dolor mattis euismod. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse pellentesque dignissim lacus. Nulla semper euismod arcu. Suspendisse egestas, erat a consectetur dapibus, felis orci cursus eros, et sollicitudin purus urna et metus. Integer eget est sed nunc euismod vestibulum. Integer nulla dui, tristique in, euismod et, interdum imperdiet, enim. Mauris at lectus. Sed egestas tortor nec mi.</p>")
add_body_content("auditions", "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ac dictum risus. Nulla facilisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Ut aliquam purus quis augue auctor ut scelerisque odio interdum. Curabitur sodales eros a magna ultricies luctus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Curabitur a orci quis ipsum vulputate dignissim ac sed dolor. Nulla facilisis, odio nec varius ultricies, mauris ligula iaculis lectus, scelerisque imperdiet felis ipsum vitae urna. Mauris at purus at nisi tincidunt viverra.</p>")
add_body_content("members", "<p>Meet the band!</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ac dictum risus. Nulla facilisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Ut aliquam purus quis augue auctor ut scelerisque odio interdum. Curabitur sodales eros a magna ultricies luctus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Curabitur a orci quis ipsum vulputate dignissim ac sed dolor. Nulla facilisis, odio nec varius ultricies, mauris ligula iaculis lectus, scelerisque imperdiet felis ipsum vitae urna. Mauris at purus at nisi tincidunt viverra.</p>")
add_body_content("contact", "<p>Contact us like so, YO</p>")

Refinery::People::Member.create(name: "Test Leo", year: 2015, photo_id: nil, voice: "Tenor", major: "Computer Science", hometown: "Berkleley, CA", bio: "<p>Test Leo is an ipsum who doesn't lorem of anything</p>")
Refinery::People::Member.create(name: "Test Daria", year: 2016, photo_id: nil, voice: "Sop", major: "Computer Science", hometown: "Somewhere, OR", bio: "<p>Test Daria is an ipsum who doesn't lorem of anything</p>")

Refinery::Events::Event.create(title: "EVONT IN FUTURE", date: "2018-01-01 00:00:00", photo_id: nil, blurb: "<p>waagh the future</p>")
Refinery::Events::Event.create(title: "eveunt in PAST", date: "2008-01-01 00:00:00", photo_id: nil, blurb: "<p>THIS WAS IN THE PAST</p>")


