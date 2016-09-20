class Livro
	attr_reader :titulo, :preco, :ano_lancamento, :possui_reimpressao
	def initialize(titulo, preco, ano_lancamento, possui_reimpressao)
		@titulo = titulo
		@preco = preco
		@ano_lancamento = ano_lancamento
		@possui_reimpressao = possui_reimpressao
		@preco = calcula_preco(preco)
	end
	private
	def calcula_preco(base) 
		if @ano_lancamento < 2006
			if @possui_reimpressao 
				 base * 0.9
			else
				 base * 0.95
			end
		elsif @ano_lancamento <= 2010
			base * 0.96
		else
			base 
		end
	end
	public
	def possui_reimpressao?
		@possui_reimpressao
	end
	public
	def to_csv
		"#{@titulo},#{@preco}, #{@ano_lancamento}"
	end
end


class Estoque
	def initialize
		@livros = [];
	end
	def imprime_nota_fiscal()
		@livros.each do | livro |
			puts " "
			puts "Titulo #{livro.titulo}"
			puts "Preco #{livro.preco}"
			puts "Ano Lancamento #{livro.ano_lancamento}"
			puts "Possui impressao #{livro.possui_reimpressao}"
		end
	end
	def exporta_csv()
		@livros.each do | livro |
			puts livro.to_csv
		end
	end
	def mais_barato_que(estoque, valor)
		@livros.select do | livro |
			livro.preco <= valor
		end
	end
	def total_livro 
		@livros.size
	end
	def adiciona(livro)
		@livros << livro if livro
	end
end

estoque = Estoque.new
estoque.adiciona Livro.new("Agile develpment with rails", 70, 2011, true)
estoque.adiciona Livro.new("Programming Ruby 1.9", 60, 2010, true)

estoque.adiciona Livro.new("The pragmatic Programming", 70, 1999, true)
estoque.adiciona Livro.new("Programming Ruby", 100, 2004, true)

estoque.exporta_csv()