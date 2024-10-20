require_relative 'CriptografiaAES'
require_relative 'gerar_json'

# Gerar uma chave secreta
chave = CriptografiaAES.gerar_chave_secreta

# Texto a ser criptografado
texto_original = "IP "
puts "Texto original: #{texto_original}"

# Criptografar o texto
texto_criptografado = CriptografiaAES.criptografar(texto_original, chave)
puts "Texto criptografado: #{texto_criptografado}"

# Gerar JSON da arquitetura
require_relative 'gerar_json'
