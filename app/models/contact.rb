class Contact < ActiveRecord::Base
    require 'csv'

    def self.import(imported_file)
        input_path = imported_file.path
        CSV.foreach(input_path, headers: true) do |row|
            name = row[0]
            phone_num = row[1]

            if name && phone_num
                Contact.create(name: name, phone_num: phone_num)
            end
        end
    end
end
