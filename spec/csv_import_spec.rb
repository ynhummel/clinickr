require 'spec_helper'
require_relative '../lib/csv_import'

describe 'Importa dados do arquivo CSV' do
  it 'com sucesso' do
  end

  context 'e falhou' do
    it 'caminho incorreto' do
      file = "tet_data.csv"
      expect {CsvImport.call(file)}.to output("Erro no caminho do arquivo CSV\n").to_stdout
    end
  end
end