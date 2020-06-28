# chrome-headless

In Testing

docker run -dit --name chromeheadless rattydave/chrome-headless

docker exec -it chromeheadless /bin/sh
chromium-browser --headless --use-gl=swiftshader --disable-software-rasterizer --mute-audio --disable-dev-shm-usage --disable-audio --remote-debugging-port=9222 --remote --debugging-address=0.0.0.0 --no-sandbox https://chaturbate.com/kellyvong/




#!/bin/bash

#wget https://raw.githubusercontent.com/TheSpeedX/PROXY-List/master/socks4.txt
#tail --lines=+3 socks4.txt > socks4_stripped.txt
#tail --lines=3 socks4.txt > socks4_stripped.txt

wget -q https://raw.githubusercontent.com/TheSpeedX/SOCKS-List/master/http.txt -O http.txt
tail -n +3 http.txt  > http_stripped.txt

#tail --lines=50 http.txt > http_stripped.txt
#/usr/bin/streamlink -f https://chaturbate.com/kellyvong worst -o kellyvong.mp4 &

debugport=1025
total=0
i=0

while read line;
     do 
	echo $line; 

       #/usr/bin/streamlink --https-proxy $line --http-proxy $line -f https://chaturbate.com/kellyvong worst -o videos/kellyvong.mp4.$line &
      
       #/usr/bin/chromium --bwsi --proxy-server="$line" --user-data-dir="session/$line" https://chaturbate.com/favorite_nicky/# &
       #/usr/bin/chromium --disable-gpu --headless --proxy-server="$line" --user-data-dir="session/$line" https://chaturbate.com/kellyvong# &

       #/usr/bin/chromium --mute-audio --disable-gpu --ignore-certificate-errors --proxy-server="$line" --user-data-dir="session/$line" https://chaturbate.com/kellyvong# &

       #http_proxy="http://$line" epiphany -p https://www.google.com/ &
       #http_proxy="http://$line" epiphany -p https://chaturbate.com/kellyvong# &

	echo "Debug Port = $debugport"
	echo "Total = $total"
	echo "Current number in round = $i"

	chromium-browser --headless \
		--use-gl=swiftshader \
		--disable-software-rasterizer \
		--mute-audio \
		--disable-dev-shm-usage \
		--disable-audio \
		--remote-debugging-port=$debugport \
		--no-sandbox --proxy-server="$line" \
		--user-data-dir="session/$line" \
                https://chaturbate.com/kellyvong/ > /dev/null 2>&1 &

       ((debugport++))
       ((total++))
       ((i++))
       
       sleep 1
     
       if [[ "$i" -gt 50 ]]; then
        sleep 30     
        i=0
        read keypress <&1
        #./killold.sh
       fi
     
done < http_stripped.txt


apk add alsa-utils bash procps

chromium-browser --headless --use-gl=swiftshader --disable-software-rasterizer --disable-dev-shm-usage 

chromium-browser --headless --use-gl=swiftshader --disable-software-rasterizer --mute-audio --disable-dev-shm-usage --disable-audio --remote-debugging-port=9222 --remote --debugging-address=0.0.0.0 --no-sandbox https://chaturbate.com/kellyvong/

