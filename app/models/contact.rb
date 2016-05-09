class Contact < ActiveRecord::Base
    require 'csv'

    def import(file)
        file_path = file.path
        CSV.foreach(file_path, headers: true) do |row|
            name = row[0]
            phone_num = row[1]

            Contact.create(name: name, phone_num: phone_num)
        end
    end
end
