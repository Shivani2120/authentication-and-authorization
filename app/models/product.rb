require 'csv'
# require 'iconv'
class Product < ApplicationRecord
    belongs_to :user

    def self.to_csv(options = {})
        CSV.generate(options) do |csv|
          csv << column_names
          all.each do |product|
            csv << product.attributes.values_at(*column_names)
          end
        end
    end

      def self.open_spreadsheet(file)
        case File.extname(file.original_filename)
         when '.csv' then Roo::Csv.new(file.path, nil, :ignore)
         when '.xls' then Roo::Excel.new(file.path)
         when '.xlsx' then Roo::Excelx.new(file.path, nil, :ignore)
         else raise "Unknown file type: #{file.original_filename}"
        end
      end
    

    # def self.to_csv
    #    attributes = %w{ id name creator}

    #    CSV.generate(headers: true) do |csv|
    #         csv << attributes

    #         all.each do |product|
    #             csv << attributes.map{|attr| product.send{attr}}
    #         end
    #    end
    # end
end
