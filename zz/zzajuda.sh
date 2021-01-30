# ----------------------------------------------------------------------------
# Mostra uma tela de ajuda com explicação e sintaxe de todas as funções.
# Opções: --lista  lista de todas as funções, com sua descrição
#         --uso    resumo de todas as funções, com a sintaxe de uso
# Uso: zzajuda [--lista|--uso]
# Ex.: zzajuda
#      zzajuda --lista
#
# Autor: Aurelio Marinho Jargas, www.aurelio.net
# Desde: 2000-05-04
# Versão: 1
# Requisitos: zzzz zztool
# ----------------------------------------------------------------------------
zzajuda ()
{
	zzzz -h ajuda "$1" && return

	local zzcor_pager

	case "$1" in
		--uso)
			# Lista com sintaxe de uso, basta pescar as linhas Uso:
			sed -n 's/^Uso: zz/zz/p' "$ZZAJUDA" |
				sort |
				zztool acha '^zz[^ ]*'
		;;
		--lista)
			# Lista de todas as funções no formato: nome descrição
			grep -A2 ^zz "$ZZAJUDA" |
				grep -v ^http |
				sed '
					/^zz/ {
						# Padding: o nome deve ter 17 caracteres
						# Maior nome: zzfrenteverso2pdf
						:pad
						s/^.\{1,16\}$/& /
						t pad

						# Junta a descricao (proxima linha)
						N
						s/\n/ /
					}' |
				grep ^zz |
				sort |
				zztool acha '^zz[^ ]*'
		;;
#@ajuda
		zz*)
			# Mostra o nome da função na primeira linha do help
			echo "$1"

			cat "${ZZDIR}/$1.sh" |
				# Extrai somente os cabeçalhos, já removendo o # do início
				sed -n '
					/^# -----* *$/,/^# -----* *$/ {
						//d
						s/^# \{0,1\}//p
					}' |
				# Agora remove trechos que não podem aparecer na ajuda
				sed '
					# Apaga a metadata (Autor, Desde, Versao, etc)
					/^Autor:/,$ d

					# Apaga a linha em branco apos Ex.:
					/^Ex\.:/,$ {
						/^ *$/d
					}'
		;;
		*)
			# Desliga cores para os paginadores antigos
			test "$PAGER" = 'less' -o "$PAGER" = 'more' && zzcor_pager=0

			# Mostra a ajuda de todas as funções, paginando
			cat "$ZZAJUDA" |
				ZZCOR=${zzcor_pager:-$ZZCOR} zztool acha 'zz[a-z0-9]\{2,\}' |
				${PAGER:-less -r}
		;;
	esac
}
