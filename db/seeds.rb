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
