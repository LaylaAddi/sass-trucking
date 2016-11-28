git add -A
git commit -m "2waytext"
git push -u origin master 
git push dokku master


dokku config:set hrc twilio_sid='AC87fdddf5c2210189b8d1dba4c0a91a3b'
dokku config:set hrc twilio_token='2a77c6c9dee1d30ae76cbc8ec3599d6e'
dokku config:set hrc twilio_number='+17162190123'