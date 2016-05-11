require 'csv'

namespace :import do

    desc "Import contacts from csv"
    task contacts: :environment do
        filename = File.join(Rails.root, 'gcontacts.csv')
        CSV.foreach(filename, headers: true) do |row|

            number = row[1].scan(/\d+/).join
            number[0] == "1" ? number[0] = '' : number
            number unless number.length != 10


        end
    end
end
