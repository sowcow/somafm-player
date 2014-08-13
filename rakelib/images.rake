require_relative 'image'


task :images do
  soma = Soma.load
  soma.images.each { |url, file|
    Image.download url, file
  }
end
