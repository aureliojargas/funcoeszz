# ----------------------------------------------------------------------------
# Exibe aleatoriamente uma frase do Sheldon, do seriado The Big Bang Theory.
# Com a opção -t ou --traduzir mostra os diálogos traduzidos.
#
# Uso: zzsheldon [-t|--traduzir]
# Ex.: zzsheldon
#
# Autor: Jonas Gentina, <jgentina (a) gmail com>
# Desde: 2015-09-25
# Versão: 2
# Licença: GPL
# Requisitos: zzaleatorio zztrim zzjuntalinhas zzlinha zztradutor
# ----------------------------------------------------------------------------
zzsheldon ()
{
	zzzz -h sheldon "$1" && return

	# Declaracoes locais:
	local url="http://the-big-bang-theory.com/quotes/character/Sheldon/"
	local begin="Quote from the episode"
	local end="Correct this quote"

	zztool dump ${url}$(zzaleatorio 123) |
	sed -n "/$begin/,/$end/p" |
	zztrim -H |
	zzjuntalinhas -i "$begin" -f "$end" -d "|" |
	zzlinha |
	tr '|' '\n' |
	sed "/$end/d;s/$begin/Episode -/;/^[[:blank:]]*$/d" |
	case $1 in
		-t | --traduzir ) zztradutor en-pt ;;
		*) cat - ;;
		esac |
	sed "2,$ { /:/!s/^/\t/; s/: /:\t/; }" |
	expand -t 10
}
