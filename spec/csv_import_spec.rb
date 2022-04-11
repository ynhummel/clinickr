require 'spec_helper'
require_relative '../lib/csv_import'

describe 'Importa dados do arquivo CSV' do
  it 'com sucesso' do
  end

  context 'e falhou' do
    it 'caminho incorreto' do
      path = "../data/tet_data.csv"
      expect {CsvImport.call(path)}.to output("Erro no caminho do arquivo CSV\n").to_stdout
    end
  end
end