# ----------------------------------------------------------------------------
# http://economia.uol.com.br/cotacoes
# Busca a cotação do dia do dólar (comercial, turismo).
# Uso: zzdolar
# Ex.: zzdolar
#
# Autor: Aurelio Marinho Jargas, www.aurelio.net
# Desde: 2000-02-22
# Versão: 7
# Licença: GPL
# ----------------------------------------------------------------------------
zzdolar ()
{
	zzzz -h dolar "$1" && return

	# Faz a consulta e filtra o resultado
	zztool dump 'http://economia.uol.com.br/cotacoes' |
		egrep  'Dólar (com\.|tur\.|comercial)' |
		sed '
			# Linha original:
			# Dólar com. 2,6203 2,6212 -0,79%

			# faxina
			/Bovespa/d
			s/com\./Comercial/
			s/tur\./Turismo /
			s/^  *Dólar //
			s/\(.*\) - \(.*\) \([0-9][0-9]h[0-9][0-9]\)/\2|\3\
\1/
			s/  *CAPTION: Dólar comercial/  Compra Venda Variação/
		' |
		tr ' |' '\t '
}
