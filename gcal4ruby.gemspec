version = File.read(File.expand_path("../VERSION", __FILE__)).strip

Gem::Specification.new do |s|
   s.name = 'gcal4ruby'
   s.version = version
   s.summary = 'A full featured wrapper for interacting with the Google Calendar API'
   s.description = "GCal4Ruby is a Ruby Gem that can be used to interact with the current version of the Google Calendar API. GCal4Ruby provides the following features: Create and edit calendar events, Add and invite users to events, Set reminders, Make recurring events."

   s.author = 'Mike Reich'
   s.email = 'mike@seabourneconsulting.com'
   s.homepage = 'http://cookingandcoding.com/gcal4ruby/'

   s.files = [
     "README.md",
     "CHANGELOG",
     "lib/gcal4ruby.rb",
     "lib/gcal4ruby/service.rb",
     "lib/gcal4ruby/calendar.rb",
     "lib/gcal4ruby/event.rb",
     "lib/gcal4ruby/recurrence.rb"
    ]
   s.rubyforge_project = 'gcal4ruby'
   s.has_rdoc = true
   s.test_files = [
     "test/unit.rb"
    ] 
   s.add_dependency('gdata4ruby', '>= 0.1.5')
end 
