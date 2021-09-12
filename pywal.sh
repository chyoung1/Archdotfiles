#!/usr/bin/env bash

PFILE="$HOME/.config/polybar/hack/colors.ini"
RFILE="$HOME/.config/polybar/hack/scripts/rofi/colors.rasi"

pywal_get() {
	wal -i "$1" -q -t
}

change_color() {
	sed -i -e "s/background = #.*/background = $BG/g" $PFILE
	sed -i -e "s/foreground = #.*/foreground = $FG/g" $PFILE
	sed -i -e "s/primary = #.*/primary = $AC/g" $PFILE
	
	cat > $RFILE <<- EOF
	/* colors */

	* {
	  al:    #00000000;
	  bg:    ${BG}FF;
	  ac:    ${AC}FF;
	  se:    ${AC}26;
	  fg:    ${FG}FF;
	}
	EOF
	
	polybar-msg cmd restart
}

if [[ -f "/bin/wal" ]]; then
	if [[ "$1" ]]; then
		pywal_get "$1"

		. "$HOME/.cache/wal/colors.sh"

		BG=`printf "%s\n" "$background"`
		FG=`printf "%s\n" "$foreground"`
		AC=`printf "%s\n" "$color1"`

		change_color
	else
		echo -e "Entre com o caminho do wallpaper. \n"
		echo "Uso : ./pywal.sh caminho/para/imagem"
	fi
else
	echo "[!] 'pywal' não encontrado, instale."
fi
