 # Driver Code for running the flagged samples
require 'json'
require 'securerandom'
require 'base64'
require 'csv'

# Code to write the Output file
 CSV.open("QaScripts/CSV_Files/TestReport/TestResults.csv","wb", :headers => true) do |writeToCSV|
	writeToCSV << ["TestCaseId","APIName","Status","Message","TimeStamp"]
 end
 csv_text = File.read("QaScripts/CSV_Files/Driver/driver.csv")
 csv = CSV.parse(csv_text, :headers => true)
 csv.each do |row|
    if(row[2].to_s.strip == "1")
		puts "Executing #{row['fileName'].to_s}"
 		require_relative "./"+row['dirName'].to_s+"/"+row['fileName'].to_s
	
 	end
 end
