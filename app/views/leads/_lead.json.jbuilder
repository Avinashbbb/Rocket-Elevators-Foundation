json.extract! lead, :id, :fullNameContact, :companyName, :email, :phoneNumber, :nameProject, :descriptionProject, :department, :message, :file, :date, :created_at, :updated_at
json.url lead_url(lead, format: :json)
