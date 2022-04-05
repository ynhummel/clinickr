require "sinatra"
require "sinatra/activerecord"
require "./lib/result"

configure do
  set :bind, '0.0.0.0'
end

get '/tests/:token_result' do
  content_type :json

  result = Result.where(token_result: params["token_result"])
  res_arr = []
  result.each do |res|
    res_arr.append(
      {
        test_type: res.tipo_exam,
        test_limits: res.lim_tipo_exam,
        result: res.result_tipo_exam
      }
    )
  end
  
  { 
    result_token: result[0].token_result,
    result_date: result[0].data_exam,
    cpf: result[0].cpf,
    name: result[0].pac_nome,
    email: result[0].pac_email,
    birthday: result[0].data_nasc,
    doctor: {
      crm: result[0].crm_med,
      crm_state: result[0].crm_estado,
      name: result[0].med_nome,
    },
    tests: res_arr
  }.to_json

end
