class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results do |t|
      t.string :cpf
      t.string :pac_nome
      t.string :pac_email
      t.date :data_nasc
      t.string :endereco
      t.string :cidade
      t.string :estado
      t.string :crm_med
      t.string :crm_estado
      t.string :med_nome
      t.string :med_email
      t.string :token_result
      t.date :data_exam
      t.string :tipo_exam
      t.string :lim_tipo_exam
      t.integer :result_tipo_exam
    end
  end
end