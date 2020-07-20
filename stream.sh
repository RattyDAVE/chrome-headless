#!/bin/bash

url=""

total=0
good=0

runme () {
 while read line;
      do 
        ((total++))
        echo $total 

        env ALL_PROXY="$proxy_prefix://$line" http_proxy="$proxy_prefix://$line" https_proxy="$proxy_prefix://$line" HTTP_PROXY="$proxy_prefix://$line" HTTPS_PROXY="$proxy_prefix://$line" curl --max-time 1 http://checkip.amazonaws.com/ > /dev/null 2>&1
       exit_status=$?
       if [[ $exit_status -lt 1 ]]; then
  	  ((good++))
          echo "Good = $good"
          cp ~/.config/falkon/profiles/default/settings.ini ~/.config/falkon/profiles/$good/settings.ini
          env ALL_PROXY="$proxy_prefix://$line" http_proxy="$proxy_prefix://$line" https_proxy="$proxy_prefix://$line" HTTP_PROXY="$proxy_prefix://$line" HTTPS_PROXY="$proxy_prefix://$line" falkon -r -p $good -c $url > /dev/null 2>&1 &

          #/usr/bin/streamlink -f $url worst -Q --http-proxy "$proxy_prefix://$line" --https-proxy "$proxy_prefix://$line" -o /dev/null &
          if [[ "$(pgrep -c falkon)" -gt 60 ]]
           then
            sleep 10
            ./killold.sh
           fi
       fi
 done < proxy.txt
}


wget -q https://raw.githubusercontent.com/TheSpeedX/SOCKS-List/master/http.txt -O proxy.txt
proxy_prefix="http"
runme

wget https://raw.githubusercontent.com/TheSpeedX/PROXY-List/master/socks4.txt -O proxy.txt
proxy_prefix="socks4a"
runme

wget https://raw.githubusercontent.com/TheSpeedX/PROXY-List/master/socks5.txt -O proxy.txt
proxy_prefix="socks5"
runme

echo "END"
