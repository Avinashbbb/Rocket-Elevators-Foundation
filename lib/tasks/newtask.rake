require "pg"
require "faker"

conn = PG.connect(host: "codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com", dbname: 'MarcosLopez', :user => 'codeboxx', :password => 'Codeboxx1!')

namespace :dwh do

    task reset: :environment do
        Rake::Task["dwh:init"].invoke
        Rake::Task["dwh:FactQuotes"].invoke
        Rake::Task["dwh:FactContact"].invoke
        Rake::Task["dwh:FactElevator"].invoke
        Rake::Task["dwh:DimCustomers"].invoke

        Rake::Task["dwh:FactIntervention"].invoke
        
    end

    task init: :environment do
        conn.exec "DROP TABLE IF EXISTS FactQuotes"
        conn.exec "CREATE TABLE FactQuotes(quoteId INTEGER, created_at DATE, companyName TEXT, email TEXT)"
    
        conn.exec "DROP TABLE IF EXISTS FactContact"
        conn.exec "CREATE TABLE FactContact(contactId INTEGER, created_at TEXT, companyName TEXT, email TEXT, projectName TEXT)"
    
        conn.exec "DROP TABLE IF EXISTS FactElevator"
        conn.exec "CREATE TABLE FactElevator(serialNumber TEXT, dateOfCom TEXT, buildingId INTEGER, customerId TEXT, buildingCity TEXT)"
    
        conn.exec "DROP TABLE IF EXISTS DimCustomers"
        conn.exec "CREATE TABLE DimCustomers(created_at TEXT, companyName TEXT, fullNameCC TEXT, emailCC TEXT, nbElevator INTEGER, customerCity TEXT)"    

        conn.exec "DROP TABLE IF EXISTS FactIntervention"
        conn.exec "CREATE TABLE FactIntervention(employeeId TEXT, buildingId TEXT, batteryID TEXT, columnId TEXT, elevatorId TEXT, start_Date_Time_of_intervention timestamp, end_Date_Time_of_intervention timestamp,result VarChar(255),report text, status varchar(255))"
    end

    task FactQuotes: :environment do
        Quote.find_each do |q|
            conn.exec ("INSERT INTO FactQuotes (quoteId, created_at, companyName, email) VALUES ('#{q.id}', '#{q.created_at}', '#{q.companyName.gsub("'", " ")}', '#{q.email}')")
        end
    end
    
    task FactContact: :environment do
        Lead.find_each do |l|
            conn.exec ("INSERT INTO FactContact (contactId, created_at, companyName, email, projectName) VALUES ('#{l.id}', '#{l.created_at}', '#{l.companyName.gsub("'", " ")}', '#{l.email}', '#{l.nameProject.gsub("'", " ")}')")
        end
    end

    task FactElevator: :environment do

        Addresse.find_each do |a|
            conn.exec ("INSERT INTO FactElevator (buildingCity) VALUES ('#{a.city.gsub("'", " ")}')")
        end
                Customer.find_each do |c|
                    conn.exec ("INSERT INTO FactElevator (customerId) VALUES ('#{c.id}')")
                end
                    Elevator.find_each do |e|
                        conn.exec ("INSERT INTO FactElevator (serialNumber, dateOfCom, buildingId) VALUES ('#{e.serial_number}', '#{e.dateCommissioning}', '#{e.column_id}')")
                    end
    end

    task DimCustomers: :environment do
        Addresse.find_each do |a|
            conn.exec ("INSERT INTO DimCustomers (customerCity) VALUES ('#{a.city.gsub("'", " ")}')")
        end
            Customer.find_each do |c|
                conn.exec ("INSERT INTO DimCustomers (created_at, companyName, fullNameCC, emailCC) VALUES ('#{c.dateCreation}', '#{c.companyName.gsub("'", " ")}', '#{c.fullName}', '#{c.email}')")
            end
                Elevator.find_each do |m|
                    conn.exec ("INSERT INTO DimCustomers (nbElevator) VALUES ('#{m.id}')")
                end
    end

    task FactIntervention: :environment do
        e_id = []
        b_id = []
        ba_id = []
        c_id = []
        el_id = []
        Employee.find_each do |e|
            e_id.append(e.id)
        end
            Building.find_each do |b|
                b_id.append(b.id)
            end
                Batterie.find_each do |ba|
                    ba_id.append(ba.id)
                end
                    Column.find_each do |c|
                        c_id.append(c.id)
                    end
                        Elevator.find_each do |e|
                            el_id.append(e.id)
                        end

                        def result
                            array = ["Success","Failure","Incomplete"]
                            return array[rand(3)]
                        end
                        def status
                            array = ["Pending","InProgress","Interrupted","Resumed","Complete"]
                            return array[rand(5)]
                        end
                        
                        for i in 0.. b_id.max
                        conn.exec ("INSERT INTO FactIntervention(employeeId, buildingId, batteryId, columnId, elevatorId, start_Date_Time_of_intervention, result, status) VALUES ('#{e_id[i]}','#{b_id[i]}','#{ba_id[i]}','#{c_id[i]}','#{el_id[i]}','#{Faker::Date.between(from: '2022-01-01', to: '2022-12-31')}','#{result()}','#{status()}')")
                        end
    end 


end

namespace :qs do
    
    q_one = "SELECT COUNT(contactId) EXTRACT(MONTH FROM t.created_at) as MonthOfDate
    FROM FactContact t"
    q_two = "SELECT COUNT(quoteId) created_at FROM FactQuotes GROUP BY MONTH(created_at)"
    q_three = "SELECT id, nbElevator FROM DimCustomers"
    
    task q_one: :environment do
        conn.exec (q_one)
    end

    task q_two: :environment do
        conn.exec (q_two)
    end

    task q_three: :environment do
        conn.exec (q_three)
    end
end