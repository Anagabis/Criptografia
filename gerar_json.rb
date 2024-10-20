require 'json'

projeto = {
  nome: "Projeto de Criptografia AES",
  linguagem: "Ruby",
  bibliotecas: [
    {
      nome: "OpenSSL",
      finalidade: "Criptografia"
    }
  ],
  classes: [
    {
      nome: "CriptografiaAES",
      descricao: "Classe para criptografar e descriptografar textos",
      metodos: [
        {
          nome: "gerar_chave_secreta",
          descricao: "Gera uma chave secreta para criptografia"
        },
        {
          nome: "criptografar",
          descricao: "Criptografa um texto usando a chave secreta"
        },
      ];
    },
  ],
  funcionamento: {
    passo_a_passo: [
      "Gerar uma chave secreta usando gerar_chave_secreta",
      "Criptografar um texto usando criptografar",
    ]
  }
},

json_output = JSON.pretty_generate(projeto)

File.open("arquitetura_projeto.json", "w") do |f|
  f.write(json_output)
end

puts "JSON da arquitetura do projeto criado com sucesso!"
