# Enter Base URL 
baseurl="http://api.nytimes.com/svc/search/v2/articlesearch.json"

# Enter API key"
key="enter your own key here"
# Establish a query --> since we want to see all articles no specific query is established, this field, at this moment, has no function in this script.
query=""
# Select the field we want to specify, in this case we would like to specify the source field. 
field="source"
# Enter a query to be searched within the specified field.
search_field="The+New+York+Times"
# Select the second field we want to specify
field2="type_of_material"
# Enter a query to be searched for within the second field
search_field2="Front+Page"
# Since the first results immediately show the total number of hits we only need page 0
page=0

# Establish the specific URL based on the pre-defined variables (as of this moment this only works for a query in a specific field, other variables might be added later on by adapting the script) 
requestUrl="$baseurl?fq=$field:(%22$search_field%22)&api-key=$key&page=$page"

# Filter the number of hits from the results (this part of the code is still a bit messy)
results=`curl -s $requestUrl | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`

# Display the results
echo "Total news-items in database:" $results

# Build a second URL (this could be changed later so that all information is retrieved via a single URL)
requestUrl2="$baseurl?fq=$field2:(%22$search_field2%22)&api-key=$key&page=$page"

# Filter the number of hits from the 2nd results
results2=`curl -s $requestUrl2 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`

# Display the second results
echo "Total front-page articles in database:" $results2
