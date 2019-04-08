class OpenDataClient
  def get_data(job_name)
    url = "https://opendata.paris.fr/api/records/1.0/search/?dataset=bilan-social-effectifs-non-titulaires-permanents&facet=annee&facet=collectivite&facet=type_de_contrat&facet=emplois&facet=niveau&refine.emplois=#{job_name}"
    response = JSON.parse(RestClient.get(Addressable::URI.parse(url).normalize.to_str))
    return response['records']
  end
end
