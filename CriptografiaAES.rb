require 'openssl'
require 'base64'

class CriptografiaAES
  ALGORITMO = 'AES-128-CBC'

  def self.gerar_chave_secreta
    OpenSSL::Cipher.new(ALGORITMO).random_key
  end

  def self.criptografar(texto, chave)
    cipher = OpenSSL::Cipher.new(ALGORITMO)
    cipher.encrypt
    cipher.key = chave
    iv = cipher.random_iv
    cipher.iv = iv
    texto_criptografado = cipher.update(texto) + cipher.final
    Base64.encode64(iv + texto_criptografado)
  end

  def self.descriptografar(texto_criptografado, chave)
    dados = Base64.decode64(texto_criptografado)
    iv = dados[0..15]
    texto_encriptado = dados[16..-1]
    
    decipher = OpenSSL::Cipher.new(ALGORITMO)
    decipher.decrypt
    decipher.key = chave
    decipher.iv = iv
    texto_decifrado = decipher.update(texto_encriptado) + decipher.final
    texto_decifrado
  end
end
