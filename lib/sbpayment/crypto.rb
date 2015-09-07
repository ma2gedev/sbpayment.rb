require 'openssl'
require_relative 'configuration'

module Sbpayment
  module Crypto
    module_function

    def encrypt(data, key: Sbpayment.config.cipher_code, iv: Sbpayment.config.cipher_iv)
      cipher = OpenSSL::Cipher.new 'DES3'
      cipher.encrypt
      cipher.key = key
      cipher.iv  = iv
      cipher.padding = 0

      q, r = data.bytesize.divmod 8
      data += ' ' * ((8 * (q + 1)) - data.bytesize) if r > 0

      cipher.update(data) + cipher.final
    end

    def decrypt(data, key: Sbpayment.config.cipher_code, iv: Sbpayment.config.cipher_iv)
      cipher = OpenSSL::Cipher.new 'DES3'
      cipher.decrypt
      cipher.key = key
      cipher.iv  = iv
      cipher.padding = 0

      (cipher.update(data) + cipher.final).sub(/ +\z/, '') # or use String#rstrip
    end
  end
end