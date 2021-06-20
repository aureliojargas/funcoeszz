# ----------------------------------------------------------------------------
# http://www.significado.origem.nom.br/
# Dicionário de nomes, com sua origem, numerologia e arcanos do tarot.
# Pode-se filtrar por significado, origem, letra (primeira letra), tarot
# marca (no mundo), numerologia ou tudo - como segundo argumento (opcional).
# Por padrão lista origem e significado.
#
# Uso: zznome nome [significado|origem|letra|marca|numerologia|tarot|tudo]
# Ex.: zznome maria
#      zznome josé origem
#
# Autor: Itamar <itamarnet (a) yahoo com br>
# Desde: 2011-04-22
# Versão: 5
# Requisitos: zzzz zztool zzsemacento zzminusculas zztrim zzutf8 zzxml
# Tags: internet, consulta
# ----------------------------------------------------------------------------
zznome ()
{
	zzzz -h nome "$1" && return

	local url='https://www.significado.origem.nom.br'
	local nome=$(echo "$1" | zzminusculas | zzsemacento)

	# Verificação dos parâmetros
	test -n "$1" || { zztool -e uso nome; return 1; }

	zztool source "${url}/nomes/${nome}.htm" |
		zzutf8 |
		awk '
			/<h2>Significado d/{next}
			/<style/,/style>/{next}
			/<script/,/<\/script>/{next}
			/class="adsbygoogle"/,/>/{next}
			{gsub(/<h2/,"\n<h2");print}
		' |
		case "$2" in
			origem     ) sed -n '/Qual a origem do nome /{s/Qual a o/O/;p;}' ;;
			significado) sed -n '/Qual o significado do nome /{s/Qual o s/S/p;}' ;;
			letra      ) sed -n '/ - Analise da Primeira Letra do Nome:/,/<h3>/{/<h3/d;p;}' ;;
			marca      )
				sed -n '
					/ - Analise da Primeira Letra do Nome:/,/Significado - Numerologia - Expressão / {
						/<h3>/,$!d
						/<h3>/ i \
Sua Marca no Mundo
						/Significado - Numerologia - Expressão /d
						p
					}
				' ;;
			numerologia) sed -n '/Significado - Numerologia - Expressão /,/ - Arcanos do Tarot/{/ - Arcanos do Tarot/d;p;}' ;;
			tarot      ) sed -n '/ - Arcanos do Tarot/,/<hr \/>/{/<hr \/>/d;p;}' ;;
			tudo       ) sed -n '/Qual a origem do nome /,/VOCE SABIA QUE\.\.\./{/<hr \/>/d;/VOCE SABIA QUE\.\.\./d;p;}' ;;
			*          ) sed -n '/Qual a origem do nome /p;/Qual o significado do nome /p' ;;
		esac |
		zzxml --untag |
		tr -s '\t' '\n' |
		awk '
			/Qual (a origem|o significado) do nome [^:]*:/ { sub(/^Qual (a|o)/,"");sub(/ o/,"O");sub(/ s/,"S") }
			/ - Numerologia - / || /Sua marca no mundo/ || /Analise da Primeira Letra do Nome:/ {print"";sub(/.* - /,"")}
			/ Arcano / { gsub(/^ Arcano [0-9]/,"\n&") }
			1' |
		zztrim
}
