baseurl="http://api.nytimes.com/svc/search/v2/articlesearch.json"

key="e011d3c8dfcd2c63f5465ecd97c02526:14:69382243"
query=""
field="source"
search_field="The+New+York+Times"
field2="type_of_material"
search_field2="Front+Page"
begin_date_year="1850"
begin_date_month="01"
begin_date_day="01"
end_date_year="1859"
end_date_month="12"
end_date_day="31"
begin_date_year2="1990"
begin_date_month2="01"
begin_date_day2="01"
end_date_year2="2013"
end_date_month2="12"
end_date_day2="31"
page=0

requestUrl="$baseurl?fq=$field:(%22$search_field%22)&api-key=$key&page=$page"

results=`curl -s $requestUrl | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`

echo "Total news-items in database:" $results

requestUrl2="$baseurl?fq=$field2:(%22$search_field2%22)&api-key=$key&page=$page"

results2=`curl -s $requestUrl2 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`

echo "Total front-page articles in database:" $results2

requestUrl3="$baseurl?fq=$field:(%22$search_field%22)&begin_date=$begin_date_year$begin_date_month$begin_date_day&end_date=$end_date_year$end_date_month$end_date_day&api-key=$key&page=$page"

results3=`curl -s $requestUrl3 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`

echo "Total news-items in database within the 1850's:" $results3

requestUrl4="$baseurl?fq=$field2:(%22$search_field2%22)&begin_date=$begin_date_year$begin_date_month$begin_date_day&end_date=$end_date_year$end_date_month$end_date_day&api-key=$key&page=$page"

results4=`curl -s $requestUrl4 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`

echo "Total front-page articles in database within the 1850's:" $results4

requestUrl5="$baseurl?fq=$field:(%22$search_field%22)&begin_date=$begin_date_year2$begin_date_month2$begin_date_day2&end_date=$end_date_year2$end_date_month2$end_date_day2&api-key=$key&page=$page"

results5=`curl -s $requestUrl5 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`

echo "Total news-items in database from the 1990's until 2013:" $results5

requestUrl6="$baseurl?fq=$field2:(%22$search_field2%22)&begin_date=$begin_date_year2$begin_date_month2$begin_date_day2&end_date=$end_date_year2$end_date_month2$end_date_day2&api-key=$key&page=$page"

results6=`curl -s $requestUrl6 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`

echo "Total front-page articles in database from the 1990'suntil 2013:" $results6
