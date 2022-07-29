Project Title : The Rocket Elevators Database
https://spireee.com/

	Project Description
*WHAT THE APPLICATION DOES:
The application uses
	- Ruby 2.7.6
	- Rails 5.2.8
	- pg gem (for the rake tasks)
	- faker gem (for the seeds file)
	
## IMPORTANT
our apis keys are obviously not here or are not the up to date ones in the project, please either specify your api keys int he .env folder
or directly in the api calls


If you have an admin account, you can just use your admin email address (from
the employee list) and enter the password : 123456 	// (Very safe!)

WHY THIS TECHNOLOGY?
MySQL is used as an operative database were most of the data get treated. But we also used a
Postgresql database that act as a Database Warehouse in the background. When the MySQL
database is filled with data, it is then sent to the Postgresql DWH in different tables and
you can ask 3 questions via rake tasks.

	Those rake task commands are:
	1. rake qs:q_one
	2. rake qs:q_two
	3. rake qs:q_three
	(You may find the code at the bottom of the newtask.rake file)

In case this does not function properly. Abort the ship, destroy the evidence and pray...
OR!
Try those queries via the SQL editor in DBeaver. These lines answers the the respective 
question numbers:

	1. select contact_id, EXTRACT(MONTH FROM creation_date)
           FROM fact_contact;
	
	2. select quote_id, EXTRACT(MONTH FROM creation_date)
	   FROM fact_quotes;
	
	3. SELECT company_name, nb_elevators
	   FROM public.dim_customers;




*HOW TO USE THE PROJECT
------------------------------------------------------------------
	LOG IN
You can create an account following the usual steps.

	ADMIN
To enter as an Admin, you need to seed it first to make it work.
username: [employee email]
password: 123456

	CONTACT US
Just fill the input fields and send it via the "Submit" button at
the bottom. It will be saved in the database.
------------------------------------------------------------------


##API
------------------------------------------------------------------

GOOGLE MAPS - Google Maps is a well know service powered by Google. It give us access to a grand variety of location. We use this services to localised our customers dynamicly in our backoffice section. All ours customers location a represented with marker and clicking thes markers show more caracteristics of the building in this location.

SENDGRID - Sendgrid is powerful api who make the connection with our customers more easy. With this api we can send message to our customers depending on diffrent event. In our case we us it to send a personalize greetings email when someone fill the contacts us form.

DROPBOX -The Dropboxx api is connected to the contact us section on the main page. 
So when a viewer fills te section and the email id happens to match the email id of our customers the file gets sent to dropboxx automaticaly. 
There is also a section on the header that says leads to customers that allowes the leads to get converted to customers. This also pushes the files into the Dropboxx!

FRESHDESK - Freshdesk helps wesites manage client tickets. We use Freshdesk in our app to handle any new quote or any new contact us request.

Amazon Polly - Amazon Polly is used to have a text to speach portion in the admin panel where an admin can get an up to date situation of rocket elevators


------------------------------------------------------------------
API FOR INTERVENTIONS
-----------------------------------------------------------------
To get the status of the elevator that has a start date as null
The status in the database are Active and Inactive. So please only use those status to get the approate results


Get
http://apicsharpavinash.herokuapp.com/api/Intervention/("enter status here")

PUT
http://apicsharpavinash.herokuapp.com/api/Intervention/("enter the ID of the intervention that needs to be modified")/("status you want to change to")/start/("enter start date that you want to change to")
PUT
http://apicsharpavinash.herokuapp.com/api/Intervention/("enter the ID of the intervention that needs to be modified")/("status you want to change to")/end/("enter end date that you want to change to")