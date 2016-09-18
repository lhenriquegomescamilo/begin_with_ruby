class Livro
	attr_reader :titulo, :preco, :ano_lancamento
	def initialize(titulo, preco, ano_lancamento)
		@titulo = titulo
		@preco = preco
		@ano_lancamento = ano_lancamento
	end
end

def livro_para_newletter(livro)
	if livro.ano_lancamento < 1999
		puts "Newsletter/liquidacao"
		puts livro.titulo
		puts livro.preco
	end
end

algoritmos = Livro.new("Algorimos", 100, 1992)
livro_para_newletter(algoritmos)