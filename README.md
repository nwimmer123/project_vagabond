# Vagabonder
## By: [Joe](https://github.com/jroers), [Rich](https://github.com/bw-giraffe), [Kayvon](https://github.com/Kranjbar), and [Noah](https://github.com/nwimmer123)

#Overview

A web site to discuss your travels and favorite cities!

Users can create an account, log in and create entries about their favorite cities. They can also update and delete their entries and profile information.

You do not have to sigup to see the entries that have been written about the cities.

#Screenshot

![Vagabonder Screenshot](http://i.imgur.com/yTxRkni.png)

#Links

[Heroku Link] (http://vagabonder.herokuapp.com/)

[Github Link] (https://github.com/bw-giraffe/project_vagabond)

#Our Approach

This was our first project together. 

We pair programmed and utilized agile development for the first few days of the project. We continued to use this method throughout the week but worked more independently on later iterations. This was a good approach, because we doubled up on the hardest elements of the project, but when the site reached a basic functionality, we spread out the work more which increased our efficiency. This maximized productivity and maintained high code standards.

We spent a lot of time the first day discussing git, so we would not have problems down the road. This proved to be a good use of time, as we ran into very few merge conflicts. We also conducted stand-ups every couple hours to check in. 

Another valuable policy we established was that if one team got seriously stuck for more then 20 minutes, we would ask for input from the whole team. This helped minimize roadblocks, and kept the whole team moving forward.

#Problems

### Validation Error Messages

We created validations for our entries easily enough. Thanks Rails!

```
class Entry < ActiveRecord::Base
  belongs_to :user
  belongs_to :city

  validates :title, length: { 
  	minimum: 1,
  	maximum: 200,
  	too_short: "must have at least %{count} character!",
  	too_long: "must have at most %{count} characters!"
  }

  validates :body, presence: true
end
```

However, for whatever reason the assigned messages did not appear, so we decided to make our own flash error messages in the entries controller.

Creating this function code was quite a headache!

```
	def create
		entry_params = params.require(:entry).permit(:title, :body, :city_id)
		@entry = Entry.new(entry_params.merge(user_id: session[:user_id]))
		if @entry.save
			redirect_to entry_path(@entry.id)
		else
			redirect_to "/cities/#{params[:entry][:city_id]}/new"
			flash[:error] = "Wrong number of characters"
		end
	end	
```

The most problematic line was the redirect.

```
redirect_to "/cities/#{params[:entry][:city_id]}/new"
```

Which is currently very ugly and could be refactored. In fact it may at this point. 

We spent a couple hours getting nil values for our city id because we could not figure out how to drill into our params successfully to get the city id. We tried, many, many different combinations and read through rail docs to no avail. It was very frustrating. Thankfully Rich figured it out.

Go Rich!!!

Another issue we encountered was datatype conflicts when comparing different ids

```
entry = Entry.find_by_id(params[:id]).user_id
if entry != session[:user_id]
```
Luckily, we were able to query the datatypes and make adjustments by converting to strings or integers. 


This was a fun, collaborative endeavour. 

#Tech Stack

Ruby, Rails, Postgresql, Git, HTML, CSS 
