class Job < ApplicationRecord
  def self.import(file)
    job_names = []
    csv_options = { col_sep: ';', headers: :first_row }
    CSV.foreach(file, csv_options) do |row|
      job_names << row['Emplois']
      attributes = {
        year: row['Année'],
        collectivity: row['Collectivité'],
        contract_type: row['Type de contrat'],
        name: row['Emplois'],
        level: row['Niveau'],
        specialty: row['Spécialité']
      }
      Job.where(attributes).destroy_all if Job.exists?(attributes)
      Job.create(attributes)
    end
    return job_names
  end
end
