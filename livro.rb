class Livro
	attr_reader :titulo, :preco, :ano_lancamento
	def initialize(titulo, preco, ano_lancamento)
		@titulo = titulo
		@preco = preco
		@ano_lancamento = ano_lancamento
		@preco = calcula_preco(preco)
	end
	def calcula_preco(base) 
		if @ano_lancamento < 2000
			base * 0.7
		else
			base
		end
	end
end
livro_rails = Livro.new("Agile develpment with rails", 70, 2011)
livro_ruby = Livro.new("Programming Ruby 1.9", 60,2010)

def imprime_nota_fiscal(livros)
	livros.each do | livro |
		puts "Titulo #{livro.titulo} - #{livro.preco}"
	end
end

livros = [livro_ruby,livro_rails]
imprime_nota_fiscal(livros)

