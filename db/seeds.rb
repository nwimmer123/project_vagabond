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

sf = City.create(name:"San Francisco", background_image:"https://cdn1.getyourguide.com/niwziy2l9cvz/1XBkFZIKqYw0248uGCuaWG/cc3d1c8fec71b6706ac961b449d2d823/san-francisco-san-francisco-bay-1112x630.jpg", coordinates: "37.774929,-122.419416")
chi = City.create(name:"Chicago", background_image:"https://upload.wikimedia.org/wikipedia/commons/8/82/Chicago_sunrise_1.jpg", coordinates: "41.878114,-87.629798")
ny = City.create(name:"New York City", background_image:"http://www.ssn.tv/wp-content/uploads/2014/07/NYC-1.jpg", coordinates: "40.712784,-74.005941")
lo = City.create(name:"London", background_image: "http://www.hdwallpapers.in/walls/tower_bridge_of_london-wide.jpg", coordinates: "51.507351,-0.127758")
gi = City.create(name:"Gibraltor", background_image: "http://www.visitgibraltar.gi/images/homepage_slider/df1aw_slide2.jpeg", coordinates: "36.140751,-5.353585")
sc = City.create(name:"Sioux City", background_image: "https://upload.wikimedia.org/wikipedia/commons/d/d1/Woodbury_County_Courthouse_setting_from_WNW_1.JPG", coordinates: "42.499994,-96.400307")


user = User.create({first_name: "Test", last_name: "Subject", email: "test@test.com", password: "123", current_city: "San Francisco"})
10.times do
    new_entry = Entry.new
    new_entry.title = FFaker::HealthcareIpsum.words(rand(8)+2).join(" ")
    new_entry.body = FFaker::HealthcareIpsum.paragraphs(1+ rand(4)).join("\n")
    # save the entry
    new_entry.save
    # associate the entry with the user
    user.entries.push new_entry
    rand_num = rand(6)
    if rand_num == 0
      sf.entries.push new_entry
    elsif rand_num == 1
      chi.entries.push new_entry
    elsif rand_num == 2
      ny.entries.push new_entry
    elsif rand_num == 3
      lo.entries.push new_entry
    elsif rand_num == 4
      gi.entries.push new_entry
    else
      sc.entries.push new_entry
    end
  end

24.times do

  # build the user params
  user_params = Hash.new
  user_params[:first_name] = FFaker::NameFR.first_name
  user_params[:last_name] = FFaker::NameBR.last_name
  user_params[:email] = FFaker::Internet.free_email
  user_params[:password]  = "123"
  # user_params[:password_confirmation] = user_params[:password]
  user_params[:current_city] = FFaker::AddressUS.city
  # save the user
  new_user = User.create(user_params)

  # create 10 articles for each user
  10.times do
    new_entry = Entry.new
    new_entry.title = FFaker::HealthcareIpsum.words(rand(8)+2).join(" ")
    new_entry.body = FFaker::HealthcareIpsum.paragraphs(1+ rand(4)).join("\n")
    # save the entry
    new_entry.save
    # associate the entry with the user
    new_user.entries.push new_entry
    rand_num = rand(6)
    if rand_num == 0
      sf.entries.push new_entry
    elsif rand_num == 1
      chi.entries.push new_entry
    elsif rand_num == 2
      ny.entries.push new_entry
    elsif rand_num == 3
      lo.entries.push new_entry
    elsif rand_num == 4
      gi.entries.push new_entry
    else
      sc.entries.push new_entry
    end
  end

end