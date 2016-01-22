# Vagabonder
## By: Joe, Rich, Kayvon and Noah

#Overview

A web site to discuss your travels and favorite cities!

Users can create an account, log in and create entries about their favorite cities. They can also update and delete their entries and profile information.

You do not have to sigup to see the entries that have been written about the cities.

#Screenshot

![Vagabonder Screenshot](http://i.imgur.com/AtW3Tmk.png)

#Links

[Heroku Link] (http://vagabonder.herokuapp.com/)

[Github Link] (https://github.com/bw-giraffe/project_vagabond)

#Our Approach

We pair programmed for the first two days and at the end of Thursday we worked more independently on styling, refactoring and the creation of this README. This was a good method, because we doubled up on the hardest elements of the project, but when the work was simpler we spread out the work more which increased our efficiency. This maximized productivity and maintained high code standards.

We spent a lot of time the first day discussing git, so we would not have problems down the road. This proved a good investment in time. We also had standups every couple hours to check in. 

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

#Tech Stack

Ruby, Rails, Postgresql, Git, HTML, CSS 
