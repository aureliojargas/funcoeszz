# ----------------------------------------------------------------------------
# http://www.correios.com.br
# Acompanha encomendas via rastreamento dos Correios.
# Uso: zzrastreamento <código_da_encomenda> ...
# Ex.: zzrastreamento RK995267899BR
#      zzrastreamento RK995267899BR RA995267899CN
#
# Autor: Frederico Freire Boaventura <anonymous (a) galahad com br>
# Desde: 2007-06-25
# Versão: 3
# Licença: GPL
# ----------------------------------------------------------------------------
zzrastreamento ()
{
	zzzz -h rastreamento "$1" && return

	test -n "$1" || { zztool -e uso rastreamento; return 1; }

	local url='http://websro.correios.com.br/sro_bin/txect01$.QueryList'

	# Para cada código recebido...
	for codigo
	do
		# Só mostra o código se houver mais de um
		test $# -gt 1 && zztool eco "**** $codigo"

		zztool dump "$url?P_LINGUA=001&P_TIPO=001&P_COD_UNI=$codigo" |
			sed '
				/ Data /,/___/ !d
				/___/d
				s/^   //'

		# Linha em branco para separar resultados
		test $# -gt 1 && echo
	done
}
