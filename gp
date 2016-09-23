git add -A
git commit -m "shipper scaffold to push DA"
git push -u origin master 
git push dokku master 

dokku checks:run hrc db_hrc



