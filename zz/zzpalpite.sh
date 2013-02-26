# ----------------------------------------------------------------------------
# Palpites de jogos para várias loterias: quina, megasena, lotomania, etc.
# Aqui está a lista completa de todas as loterias suportadas:
# quina, megasena, duplasena, lotomania, lotofácil, timemania, federal, loteca
#
# Uso: zzpalpite [quina|megasena|duplasena|lotomania|lotofacil|federal|timemania|loteca]
# Ex.: zzpalpite
#      zzpalpite megasena
#      zzpalpite megasena federal lotofacil
#
# Autor: Itamar <itamarnet (a) yahoo com br>
# Desde: 2012-06-03
# Versão: 3
# Licença: GPL
# Requisitos: zzseq
# ----------------------------------------------------------------------------
zzpalpite ()
{
	zzzz -h palpite "$1" && return

	local tipo num posicao numeros palpites inicial final i
	local qtde=0
	local tipos='quina megasena duplasena lotomania lotofacil federal timemania loteca'

	# Escolhe as loteria
	[ "$1" ] && tipos=$(echo "$*" | zzminusculas | zzsemacento)

	for tipo in $tipos
	do
		# Cada loteria
		case "$tipo" in
			lotomania)
				inicial=0
				final=99
				qtde=50
			;;
			lotofacil|facil)
				inicial=1
				final=25
				qtde=15
			;;
			megasena|mega)
				inicial=1
				final=60
				qtde=6
			;;
			duplasena|dupla)
				inicial=1
				final=50
				qtde=6
			;;
			quina)
				inicial=1
				final=80
				qtde=5
			;;
			federal)
				inicial=0
				final=99999
				numero=$(echo "$inicial + ( ${RANDOM} / 32766 ) * ( $final - $inicial )" | bc -l | sed 's/\..*$//g')
				zztool eco $tipo:
				printf " %0.5d\n\n" $numero
				qtde=0
				unset num posicao numeros palpites inicial final i
			;;
			timemania|time)
				inicial=1
				final=80
				qtde=10
			;;
			loteca)
				i=1
				zztool eco $tipo:
				while ([ "$i" -le "14" ])
				do
					printf " Jogo %0.2d: Coluna %d\n" $i $(($RANDOM % 3)) | sed 's/Coluna 0/Coluna do Meio/g'
					let i++
				done
				echo
				qtde=0
				unset num posicao numeros palpites inicial final i
			;;
		esac

		# Todos os numeros da loteria seleciona
		if [ "$qtde" -gt "0" ]
		then
			numeros=$(zzseq -f '%0.2d ' $inicial $final)
		fi

		# Loop para gerar os palpites
		i="$qtde"
		while ([ "$i" -gt "0" ])
		do
			# Posicao a ser escolhida
			posicao=$(echo "$inicial + ( ${RANDOM} / 32766 ) * ( $final - $inicial )" | bc -l | sed 's/\..*$//g')
			[ $tipo = "lotomania" ] && let posicao++

			# Extrai o numero na posicao selecionada
			num=$(echo $numeros | cut -f $posicao -d ' ')

			palpites=$(echo "$palpites $num")

			# Elimina o numero escolhido
			numeros=$(echo "$numeros" | sed "s/$num //")

			# Diminuindo o contador e quantidade de itens em "numeros"
			let i--
			let final--
		done

		if ([ "$palpites" ])
		then
			palpites=$(echo "$palpites" | tr ' ' '\n' | sort -n -t ' ' | tr '\n' ' ')
			if ([ $(echo " $palpites" | wc -w ) -ge "10" ])
			then
				palpites=$(echo "$palpites" | sed 's/\(\([0-9]\{2\} \)\{5\}\)/\1\n /g')
			fi
		fi

		# Exibe palpites
		if [ "$qtde" -gt "0" ]
		then
			zztool eco $tipo:
			echo "$palpites"|sed '/^ *$/d'
			echo

			#Zerando as variaveis
			unset num posicao numeros palpites inicial final qtde i
		fi
	done
}
