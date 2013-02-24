require 'csv'

task :create_languages => :environment do
  csv_text = File.read('lib/languages/languages.csv')
  csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    row = row.to_hash.with_indifferent_access
    LanguageListing.create!(row.to_hash.symbolize_keys)
  end
end