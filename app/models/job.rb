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

  def self.save_api_data(job_names)
    job_names.uniq.each do |job_name|
      OpenDataClient.new.get_data(job_name).each do |record|
        job = Job.where(
          year: record['fields']['annee'],
          collectivity: record['fields']['collectivite'],
          contract_type: record['fields']['type_de_contrat'],
          name: record['fields']['emplois'],
          level: record['fields']['niveau'],
          specialty: record['fields']['specialite']
        ).first
        job&.women_count = record['fields']['nombre_de_femmes']
        job&.men_count = record['fields']['nombre_d_hommes']
        job&.save
      end
    end
  end

  def gap
    if women_count.nil? && men_count.nil?
      'No data'
    elsif women_count.zero? && men_count.zero?
      'No staff'
    else
      ((women_count - men_count).abs / ((men_count + women_count).to_f / 2) * 100).round
    end
  end
end
