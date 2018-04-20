#!/bin/bash

#for any questions please write to eropkin@trafficstore.com


#in this script we will monitor price on amazon and if price wiil be lower then our, then scipt will send telegramm message

#include various functions for bot
source ./help_scripts/var_functions.sh
source ./help_scripts/bot_bot.sh

#here we get parameters for script. Source code of this function you can see in help_scripts/var_functions.sh
url=`get_promo_url`

gen_bot_js start
goto_url "$url"
save_page_in_html
gen_bot_js end

start_bot vk_bot.js

#in this part of code we write for-loop, which works 56 seconds.
for j in `seq 1 56`
do
        sleep 1
        is_run=`is_process_run firefox`
        if [ $is_run -eq 0 ]
        then
                break
        fi
done

#if browser works after time limit ended we will kill it
pkill firefox

price=`cat /tmp/page.htm | tr '>' '\n'  | grep -m 1 -A 3 price1 | tail -n 1 | gawk -F'.' '{print $1}'`

#after you get price, you can send it to our database, to telegram or save it on your server using rest api with curl

if (($(echo "$price < 5" | bc -l)))
then
        #please insert here your data
        send_message_telegramm $chat_id $bot_id "price ok"

	
fi

job_done DONE

