# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# require 'ffaker'

# Pro tip: Don't run this in PRD.

Entry.destroy_all
User.destroy_all
City.destroy_all

sf = City.create(name:"San Francisco Bay Area", background_image:"https://cdn1.getyourguide.com/niwziy2l9cvz/1XBkFZIKqYw0248uGCuaWG/cc3d1c8fec71b6706ac961b449d2d823/san-francisco-san-francisco-bay-1112x630.jpg", coordinates: "37.774929,-122.419416")
chi = City.create(name:"Chicagoland", background_image:"https://upload.wikimedia.org/wikipedia/commons/8/82/Chicago_sunrise_1.jpg", coordinates: "41.878114,-87.629798")
ny = City.create(name:"New York City", background_image:"https://upload.wikimedia.org/wikipedia/commons/8/8d/Pano_Manhattan2007_amk.jpg", coordinates: "40.712784,-74.005941")
lo = City.create(name:"London", background_image: "https://alitebox.files.wordpress.com/2012/02/westminster-panoramic.jpg", coordinates: "51.507351,-0.127758")
sc = City.create(name:"Sioux City", background_image: "https://upload.wikimedia.org/wikipedia/commons/d/d1/Woodbury_County_Courthouse_setting_from_WNW_1.JPG", coordinates: "42.499994,-96.400307")
bo = City.create(name:"Boston Area", background_image: "https://c2.staticflickr.com/6/5110/5607445665_f93e1183d7_b.jpg", coordinates: "42.360082,-71.058880")
sj = City.create(name:"San Juan", background_image: "http://farm7.staticflickr.com/6047/6280735866_7fbbbbb7e2_b.jpg", coordinates: "18.466334,-66.105722")
pr = City.create(name:"Providence", background_image: "https://iscrapapp.com/wp-content/uploads/2014/03/Providence-scrap-yards.jpg", coordinates: "41.823,-71.418")
sj = City.create(name:"Poughkeepsie", background_image: "https://upload.wikimedia.org/wikipedia/commons/6/64/Poughkeepsie,_NY_spring_2010_bird's-eye_view.JPG", coordinates: "41.700,-73.920")
sj = City.create(name:"Johnstown", background_image: "http://www.visitjohnstownpa.com/sites/visitjohnstownpa.com/files/styles/cm_rotator_image/public/visit_johnstown_pa_slider_inclined_plane.jpg?itok=MNtbjIKx", coordinates: "40.328,-78.914")

# sample code to insert city into database without wiping pre existing data
# INSERT INTO cities (name, background_image, created_at, updated_at, coordinates) VALUES ('Arispe', 'http://dev.virtualearth.net/REST/v1/Imagery/Map/Aerial/40.948730,-94.216232/17?mapSize=596,446&key=AmdvKO2hNoyLePakiVzRBZiGPKCxV6MtwWneohoPfmXclTaRTzvT6_Ict5-PBHO6', '03/17/2016', '03/17/2016', '40.9494354,-94.2191198');