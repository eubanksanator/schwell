require 'csv'

namespace :import do

    desc "Import contacts from csv"
    task contacts: :environment do
        filename = File.join(Rails.root, 'gcontacts.csv')
        CSV.foreach(filename, headers: true) do |row|

            puts row[0]
            puts row[1]
            # puts filename.count
        end
    end
end
