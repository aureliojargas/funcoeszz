# ----------------------------------------------------------------------------
# http://www.babylon.com
# Tradução de uma palavra em inglês para vários idiomas.
# Francês, alemão, japonês, italiano, hebreu, espanhol, holandês e português.
# Se nenhum idioma for informado, o padrão é o português.
# Uso: zzdicbabylon [idioma] palavra   #idioma:dut fre ger heb ita jap ptg spa
# Ex.: zzdicbabylon hardcore
#      zzdicbabylon jap tree
#
# Autor: Aurelio Marinho Jargas, www.aurelio.net
# Desde: 2000-02-22
# Versão: 1
# Licença: GPL
# ----------------------------------------------------------------------------
zzdicbabylon ()
{
	zzzz -h dicbabylon "$1" && return

	local idioma='ptg'
	local idiomas=' dut fre ger heb ita jap ptg spa '
	local tab=$(printf %b '\t')

	# Verificação dos parâmetros
	test -n "$1" || { zztool -e uso dicbabylon; return 1; }

	# O primeiro argumento é um idioma?
	if test "${idiomas% $1 *}" != "$idiomas"
	then
		idioma=$1
		shift
	fi

	zztool source "http://online.babylon.com/cgi-bin/trans.cgi?lang=$idioma&word=$1" |
		sed "
			/OT_CopyrightStyle/,$ d
			/definition/,/<\/div>/!d
			/GA_google/d
			s/^[$tab ]*//
			s/<[^>]*>//g
			/^$/d
			N;s/\n/ /
			s/      / /
			" |
		zztool texto_em_utf8
}
