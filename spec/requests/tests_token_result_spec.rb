require 'spec_helper'
require_relative '../../app'

describe 'get /tests/:token' do
  def app
    Sinatra::Application
  end
  it 'com sucesso' do
    Result.create!(
      cpf: "048.973.170-88" , pac_nome: "Emilly Batista Neto" ,pac_email:"gerald.crona@ebert-quigley.com", 
      data_nasc: "2001-03-11" , endereco: "165 Rua Rafaela" , cidade: "Ituverava", estado: "Alagoas", 
      crm_med: "B000BJ20J4", crm_estado: "PI", med_nome: "Maria Luiza Pires", med_email: "denna@wisozk.biz",
      token_result: "IQCZ17", data_exam: "2021-08-05",tipo_exam: "hemácias", lim_tipo_exam: "45-52",
      result_tipo_exam: 97
    )
    Result.create!(
      cpf: "048.973.170-88" , pac_nome: "Emilly Batista Neto" ,pac_email:"gerald.crona@ebert-quigley.com", 
      data_nasc: "2001-03-11" , endereco: "165 Rua Rafaela" , cidade: "Ituverava", estado: "Alagoas", 
      crm_med: "B000BJ20J4", crm_estado: "PI", med_nome: "Maria Luiza Pires", med_email: "denna@wisozk.biz",
      token_result: "IQCZ17", data_exam: "2021-08-05",tipo_exam: "leucócitos", lim_tipo_exam: "45-52",
      result_tipo_exam: 89
    )
    Result.create!(
      cpf: "048.108.026-04" , pac_nome: "Juliana dos Reis Filho" ,pac_email:"mariana_crist@kutch-torp.com", 
      data_nasc: "1995-07-03" , endereco: "527 Rodovia Júlio" , cidade: "Lagoa da Canoa", estado: "Paraíba", 
      crm_med: "B0002IQM66", crm_estado: "SC", med_nome: "Maria Helena Ramalho", med_email: "rayford@kemmer-kunze.info",
      token_result: "0W9I67", data_exam: "2021-07-09",tipo_exam: "hemácias", lim_tipo_exam: "45-52",
      result_tipo_exam: 28
    )

    get '/tests/IQCZ17'

    parsed_response = JSON.parse(last_response.body)
    expect(last_response.status).to eq 200
    expect(parsed_response["result_token"]).to eq 'IQCZ17'
    expect(parsed_response["cpf"]).to eq '048.973.170-88'
    expect(parsed_response["name"]).to eq 'Emilly Batista Neto'
    expect(parsed_response["email"]).to eq 'gerald.crona@ebert-quigley.com'
    expect(parsed_response["birthday"]).to eq '2001-03-11'
  end

  it 'test not found 404' do
    Result.create!(
      cpf: "048.973.170-88" , pac_nome: "Emilly Batista Neto" ,pac_email:"gerald.crona@ebert-quigley.com", 
      data_nasc: "2001-03-11" , endereco: "165 Rua Rafaela" , cidade: "Ituverava", estado: "Alagoas", 
      crm_med: "B000BJ20J4", crm_estado: "PI", med_nome: "Maria Luiza Pires", med_email: "denna@wisozk.biz",
      token_result: "IQCZ17", data_exam: "2021-08-05",tipo_exam: "hemácias", lim_tipo_exam: "45-52",
      result_tipo_exam: 97
    )
    Result.create!(
      cpf: "048.108.026-04" , pac_nome: "Juliana dos Reis Filho" ,pac_email:"mariana_crist@kutch-torp.com", 
      data_nasc: "1995-07-03" , endereco: "527 Rodovia Júlio" , cidade: "Lagoa da Canoa", estado: "Paraíba", 
      crm_med: "B0002IQM66", crm_estado: "SC", med_nome: "Maria Helena Ramalho", med_email: "rayford@kemmer-kunze.info",
      token_result: "0W9I67", data_exam: "2021-07-09",tipo_exam: "hemácias", lim_tipo_exam: "45-52",
      result_tipo_exam: 28
    )

    get '/tests/OOOO00'

    # parsed_response = JSON.parse(last_response.body)
    # expect(parsed_response["error"]).to eq 'Objeto não encontrado'
    # expect(parsed_response.status).to eq 404

  end
end