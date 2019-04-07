class Job < ApplicationRecord
  def self.import(file)
    csv_options = { col_sep: ';', headers: :first_row }
    CSV.foreach(file, csv_options) do |row|
      attributes = {
        year: row['Année'],
        collectivity: row['Collectivité'],
        contract_type: row['Type de contrat'],
        name: row['Emplois'],
        level: row['Niveau'],
        specialty: row['Spécialité']
      }
      Job.create(attributes)
    end
  end
end
