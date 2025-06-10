# curl -s http://api.coindesk.com/v1/bpi/currentprice.json | python -c "import json, sys; print(json.load(sys.stdin)['bpi']['USD']['rate'])"
curl -s rate.sx/1BTC | cut -d . -f 1 |rev| fold -w3 | paste -sd'.' - |rev
