# ----------------------------------------------------------------------------
# Mostra os MAC address disponiveis.
# Uso: zzmacaddress
# Ex.: zzmacaddress
#
# Autor: Adriano Laureano, @sl4ureano
# Desde: 2018-10-09
# Versão: 1
# Licença: GPL
# Tags: sistema, consulta
# Nota: requer ifconfig
# ----------------------------------------------------------------------------
zzmacaddress ()
{
	zzzz -h macaddress "$1" && return

	which ifconfig 1>/dev/null 2>&1 || { zztool erro "ifconfig não instalado"; return 1; }

	ifconfig | sed -n '/ HW\|ether /{s/.*\(\([0-9A-Fa-f]\{2\}:\)\{5\}[0-9A-Fa-f]\{2\}\).*/\1/;p;}'
}
