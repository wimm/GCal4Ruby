#GCal4Ruby

##Introduction
       
GCal4Ruby is a full featured wrapper for the google calendar API.  GCal4Ruby implements
all of the functionality available through the Google Calnedar API, including permissions,
attendees, reminders and event recurrence.  

##Author and Contact Information

GCal4Ruby was created and is maintained by [Mike Reich](mailto:mike@seabourneconsulting.com) 
and is licenses under the LGPL v3.  Feel free to use and update, but be sure to contribute your
code back to the project and attribute as required by the license.  You can find the text of the LGPL 
here: [http://www.gnu.org/licenses/lgpl.html](http://www.gnu.org/licenses/lgpl.html).

##Website

[http://cookingandcoding.com/gcal4ruby/](http://cookingandcoding.com/gcal4ruby/)

##Description

GCal4Ruby has three major components: the service, calendar and event objects.  Each service
has many calendars, which in turn have many events.  Each service is the representation of a
google account, and thus must be successfully authenticated using valid Google Calendar
account credentials.  

##Examples

Below are some common usage examples.  For more examples, check the documentation.

###Service

1. Authenticate

		service = Service.new
    	service.authenticate("user@gmail.com", "password")

2. Get Calendar List for all calendars

    	calendars = service.calendars

3. Get Calendar List for all calendars that the authenticated user has owner access level

    	calendars = service.calendars(:only_owner_access_level => true)

###Calendar

All usages assume a successfully authenticated Service.

1. Create a new Calendar

		cal = Calendar.new(service)

2. Find a calendar by ID

	    cal = Calendar.find(service, {:id => cal_id})

3. Get all calendar events

	    cal = Calendar.find(service, {:id => cal_id})
	    events = cal.events

4. Find an existing calendar by title

	    cal = Calendar.find(service, {:title => "New Calendar"})

5. Find all calendars containing a search term

	    cal = Calendar.find(service, "Soccer Team")

###Event

All usages assume a successfully authenticated Service and valid Calendar.

1. Create a new Event

	    event = Event.new(service, {:calendar => cal, :title => "Soccer Game", :start => Time.parse("12-06-2009 at 12:30 PM"), :end > Time.parse("12-06-2009 at 1:30 PM"), :where => "Merry Playfields"})
	    event.save

2. Find an existing Event by title

	    event = Event.find(service, {:title => "Soccer Game"})

3. Find an existing Event by ID

	    event = Event.find(service, {:id => event.id})

4. Find all events containing the search term

	    event = Event.find(service, "Soccer Game")

5. Find all events on a calendar containing the search term

	    event = Event.find(service, "Soccer Game", {:calendar => cal.id})

6. Find events within a date range

	    event = Event.find(service, "Soccer Game", {'start-min' => Time.parse("01/01/2010").utc.xmlschema, 'start-max' => Time.parse("06/01/2010").utc.xmlschema})

7. Create a recurring event for every saturday

		event = Event.new(service)
	    event.title = "Baseball Game"
	    event.calendar = cal
	    event.where = "Municipal Stadium"
	    event.recurrence = Recurrence.new
		event.recurrence.start_time = Time.parse("06/20/2009 at 4:30 PM")
		event.recurrence.end_time = Time.parse("06/20/2009 at 6:30 PM")
		event.recurrence.frequency = {"weekly" => ["SA"]}
		event.save 

8. Create an event with a 15 minute email reminder

		event = Event.new(service)
		event.calendar = cal
		event.title = "Dinner with Kate"
		event.start_time = Time.parse("06/20/2009 at 5 pm")
		event.end_time = Time.parse("06/20/2009 at 8 pm")
		event.where = "Luigi's"
		event.reminder = {:minutes => 15, :method => 'email'}
		event.save

9. Create an event with attendees

		event = Event.new(service)
		event.calendar = cal
		event.title = "Dinner with Kate"
		event.start_time = Time.parse("06/20/2009 at 5 pm")
		event.end_time = Time.parse("06/20/2009 at 8 pm")
		event.attendees => {:name => "Kate", :email => "kate@gmail.com"}
		event.save
