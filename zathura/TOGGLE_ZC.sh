#!/bin/bash
# Colors order
# normal -> grubbox -> brubbox-inverted
TOGGLE_ZC=$(<$HOME/.config/zathura/TOGGLE_ZC)
if [[ $TOGGLE_ZC == "normal" ]]
then
	wtype "¡qq¡qw¡i"
	TOGGLE_ZC="grubbox"
elif [[ $TOGGLE_ZC == "grubbox" ]]
then
	wtype "¡wq¡ww"
	TOGGLE_ZC="grubbox-inverted"
elif [[ $TOGGLE_ZC == "grubbox-inverted" ]]
then
	wtype "¡i"
	TOGGLE_ZC="normal"
else
	TOGGLE_ZC="grubbox"
fi

echo $TOGGLE_ZC > $HOME/.config/zathura/TOGGLE_ZC
