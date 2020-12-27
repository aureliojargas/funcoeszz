# ----------------------------------------------------------------------------
# http://www.infomoney.com.br
# Busca cotações do dia de algumas moedas em relação ao Real (compra e venda).
# Uso: zzcotacao
# Ex.: zzcotacao
#
# Autor: Itamar <itamarnet (a) yahoo com br>
# Desde: 2013-03-19
# Versão: 5
# Licença: GPL
# Requisitos: zzjuntalinhas zzsqueeze zztrim zzunescape zzxml
# Tags: internet, consulta
# ----------------------------------------------------------------------------
zzcotacao()
{
	zzzz -h cotacao "$1" && return

	zztool eco "Infomoney"
	zztool source "http://www.infomoney.com.br/mercados/cambio" |
		sed -n '/<thead/,/thead>/p;/<tbody/,/tbody>/{ s/ *</</g;p;}' |
		zzjuntalinhas -i '<tr>' -f '</tr>' |
		zzxml --untag |
		zzsqueeze |
		zztrim |
		zzunescape --html |
		awk '
	/n\/d/ {next}
	{
		if ( NR == 1 ) printf "%18s  %6s  %6s   %6s\n", "", $2, $3, $4
		if ( NR >  1 ) {
			if (NF == 4) printf "%-18s  %6s  %6s  %6s\n", $1, $2, $3, $4
			if (NF == 5) printf "%-18s  %6s  %6s  %6s\n", $1 " " $2, $3, $4, $5
		}
	}'
}
