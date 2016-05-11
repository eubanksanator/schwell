class Contact < ActiveRecord::Base
    require 'csv'

    def self.import(imported_file)
        input_path = imported_file.path
        CSV.foreach(input_path, headers: true) do |row|
            name = row[0]
            number = row[1]

            next if !number

            valid_number = number.scan(/\d+/).join
            valid_number[0] == "1" ? valid_number[0] = '' : valid_number
            valid_number unless valid_number.length != 10

            if name && valid_number
                Contact.create(name: name, phone_num: valid_number)
            end
        end
    end

end
