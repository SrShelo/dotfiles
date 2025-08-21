# !/usr/bin/env bash
#
# You might be thinking "why this guy made this script to only show volume percentage
# when it is above 50%?". Weeell... most of the time I don't want to know that number,
# because I get very obsessed with leaving the volume only in multiples of 10 or 25,
# which makes the audio very uncontrollable with a low volume, but a difference of 10%
# get less perceptible with big numbers, since volume works in a logarithmic scale.
# And, I finally decided that it is necessary to show the volume when it is high, so
# when I'm testing the audio and I don't hear anything, it warn me if I'm rising the
# volume too much.

notif_time=1000 #(ms)
vol_threshold=0.5 # (1 = 100%)

last_notif_id_file='/tmp/last_vol_notif_id'
last_source_notif_id_file='/tmp/last_source_vol_notif_id'
# last_source_notif_id_file=$last_notif_id_file

last_notif_id=$(cat $last_notif_id_file)
last_source_notif_id=$(cat $last_source_notif_id_file)

if [[ $last_notif_id == '' ]]; then
    last_notif_id=0
fi
if [[ $last_source_notif_id == '' ]]; then
    last_source_notif_id=0
fi

if [[ $1 != '' ]]; then
    if [[ $1 == 'toggle-mute-source' ]] || [[ $1 == 'toggle-mute-mic' ]]; then
        wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
        if [[ $(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | awk '{print $3}') == '' ]]; then
            state='UNMUTED'
            # last_notif_id=$(bc <<< "$last_notif_id + 1")
        else
            state='MUTED'
        fi
        last_source_notif_id=$(notify-send "MIC: $state" -u low -a volume-control -t $notif_time -r $last_source_notif_id -p)
        echo $last_source_notif_id > $last_source_notif_id_file
    elif [[ $1 == 'toggle-mute' ]]; then
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        if [[ $(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $3}') == '' ]]; then
            state='UNMUTED'
            # last_notif_id=$(bc <<< "$last_notif_id + 1")
        else
            state='MUTED'
        fi
        vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}')
        if [[ $(bc <<< "$vol >= $vol_threshold") == 1 ]]; then
            vol=$(bc <<< "$vol * 100" | sed '/\./,//s/0*$//' | sed 's/\.$//')
            vol="$vol% "
        else
            vol=''
        fi
        last_notif_id=$(notify-send "VOL: $vol$state" -u low -a volume-control -t $notif_time -r $last_notif_id -p)
        echo $last_notif_id > $last_notif_id_file
    else
        wpctl set-volume '@DEFAULT_AUDIO_SINK@' $1

        if [[ $last_notif_id == '' ]]; then
            last_notif_id=0
        fi
        vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}')
        if [[ $(bc <<< "$vol >= $vol_threshold") == 1 ]]; then
            vol=$(bc <<< "$vol * 100" | sed '/\./,//s/0*$//' | sed 's/\.$//')
            last_notif_id=$(notify-send 'VOL: '$vol'%' -u low -a volume-control -t $notif_time -r $last_notif_id -p)
            echo $last_notif_id > $last_notif_id_file
        fi
    fi
fi


