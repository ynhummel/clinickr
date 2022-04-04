require 'spec_helper'
require './lib/methods/csv_import'

describe 'Importa dados do arquivo CSV' do
  it 'com sucesso' do

  end

  context 'e falhou' do
    it 'caminho incorreto' do
      path = "../data/tet_data.csv"
      db = "clinickr_test"

      expect {csv_import(path: path, dbname: db)}.to output("Erro no caminho do arquivo CSV\n").to_stdout
    end

  end
end