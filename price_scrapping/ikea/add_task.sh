#!/bin/bash

echo '{
    "projectId": "4195574",
    "promotions": [
        {
            "query": "dsfsdf.ru",
            "url": "https://www.ikea.com/ru/ru/catalog/products/50387221/",
            "quantity": 1,
            "promoType": 131,
            "text": "'`cat $1 | base64 | tr '\n' ' '`'"
        }
    ]
}' > /tmp/bj

curl -X POST -v -H "Content-Type: application/json" -H "X-SERVICE-KEY:0RGT13IOZE4YBXKAMV5NPL2CWJD9QUH7" "https://api.trafficstore.com/promotion/add" -d @/tmp/bj

