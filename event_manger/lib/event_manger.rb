require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, '0')[0..4]
end

def legislators_by_zipcode(zip)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

  begin
    civic_info.representative_info_by_address(
      address: zip,
      levels: 'country',
      roles: %w[legislatorUpperBody legislatorLowerBody]
    ).officials

  rescue StandardError
    'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
  end
end

def phone_number(number)

  if number.nil? ||  number.length < 10 || (number.length > 11 && number[0] != 1)
    number = 'unavilable plz contact thier website'
  elsif number.length == 11 && number[0] == 1
    number[1..10]
  else
    number
  end
end

def save_thank_you_letter(id, form_letter)
  Dir.mkdir('output') unless Dir.exist?('output')

  filename = "output/thanks_#{id}.html"

  File.open(filename, 'w') do |file|
    file.puts form_letter
  end
end

puts 'EventManager initialized.'

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

template_letter = File.read('form_letter.erb')
erb_template = ERB.new template_letter

contents.each do |row|
  id = row[0]
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])
  legislators = legislators_by_zipcode(zipcode)
  p '********************************************************************8'
  

  form_letter = erb_template.result(binding)

  save_thank_you_letter(id, form_letter)
end










































# require 'csv'
# require 'erb'
# require 'google/apis/civicinfo_v2'

# puts 'Event Manager Initilized!'
# p File.exist? 'event_attendees.csv'
# p File.exist? 'form_letter.html'

# template_letter = File.read('form_letter.html')
# p template_letter
# # contents = File.read('event_attendees.csv')
# # puts contents

# # lines = File.readlines('event_attendees.csv')

# # lines.each do |line|
# #     next if line == " ,RegDate,first_Name,last_Name,Email_Address,HomePhone,Street,City,State,Zipcode\n"
# #     columns = line.split(",")
# #     puts "hi: #{columns[2]} your post code is #{columns[-1]}"
# # end

# contents = CSV.open('event_attendees.csv', headers: true, header_converters: :symbol)

# civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
# civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

# contents.each do |row|
#   name = row[:first_name]
#   zip = row[:zipcode]
#   zip = zip.to_s.rjust(5, '0')[0..4]
#   begin
#     legislators = civic_info.representative_info_by_address(
#       address: zip,
#       levels: 'country',
#       roles: %w[legislatorUpperBody legislatorLowerBody]
#     )
#     legislators = legislators.officials

#     legislator_names = legislators.map do |legislator|
#       legislator.name
#     end

#     legislators_string = legislator_names.join(', ')

#     personal_letter = template_letter.gsub('FIRST_NAME', name)
#     personal_letter.gsub!('LEGISLATORS', legislators_string)
#   rescue StandardError
#     puts 'suck a dick'
#   end

#   #   legislator_names = legislators.map(&:name)

#   puts '*****************************'
#   puts personal_letter
#   puts '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'
# end
