require 'csv'
require 'pg'

class CsvImport
  def self.call(path)
    begin
      csv_data = CSV.read(path, col_sep: ';')
      csv_data.shift
    rescue Errno::ENOENT
      puts "Erro no caminho do arquivo CSV"
    else
      begin
        
        con = PG.connect host: 'clinickr_db', 
                         dbname: 'clinickrdb', 
                         user: 'clinickr', 
                         password: 'clinickr'
        
        con.exec "CREATE TABLE IF NOT EXISTS Results(
                    Id SERIAL PRIMARY KEY, cpf VARCHAR, pac_nome VARCHAR,
                    pac_email VARCHAR, data_nasc DATE, endereco VARCHAR,
                    cidade VARCHAR, estado VARCHAR, crm_med VARCHAR, crm_estado VARCHAR,
                    med_nome VARCHAR, med_email VARCHAR, token_result VARCHAR,
                    data_exam DATE, tipo_exam VARCHAR, lim_tipo_exam VARCHAR,
                    result_tipo_exam INT)"
        puts 'Inserindo dados na tabela...'
        
        csv_data.each do |line|
          cpf = line[0]
          pac_nome = line[1].gsub(/\'/, '\'\'')
          pac_email = line[2].gsub(/\'/, '\'\'')
          data_nasc = line[3]
          endereco = line[4].gsub(/\'/, '\'\'')
          cidade = line[5].gsub(/\'/, '\'\'')
          estado = line[6]
          crm_med = line[7]
          crm_estado = line[8]
          med_nome = line[9].gsub(/\'/, '\'\'')
          med_email = line[10].gsub(/\'/, '\'\'')
          token_result = line[11]
          data_exam = line[12]
          tipo_exam = line[13].gsub(/\'/, '\'\'')
          lim_tipo_exam = line[14]
          result_tipo_exam =line[15]
          
          con.exec "INSERT INTO Results VALUES(DEFAULT, '#{cpf}', '#{pac_nome}', '#{pac_email}',
          '#{data_nasc}', '#{endereco}', '#{cidade}', '#{estado}', 
          '#{crm_med}', '#{crm_estado}', '#{med_nome}', '#{med_email}', 
          '#{token_result}', '#{data_exam}', '#{tipo_exam}', '#{lim_tipo_exam}', 
          #{result_tipo_exam})"
        end
    
        puts 'Dados inseridos com sucesso.'
        
      rescue PG::Error => e
        
        puts e.message
        
      ensure
        
        con.close if con
        
      end  
    end
  end
end