# Print number of news-items with New York Times as a source, and give a total count per decade. Paste results into a text file.
cat nytimes_humanities_tabbed.csv | awk -F '\t' '{print int($1/10)*10,$6}' | grep 'The New York Times' | sort | uniq -c | awk '{print $1 "\t" $2}' > artikelen_per_decennium.txt

# Print number of Front-page-articles with New York Times as a source (the dataset only contains Front-page-articles from the New York Times), and give a total count per decade.  Paste results into a text file.
cat nytimes_humanities_tabbed.csv | sed -E 's/([0-9]{4})-/\1'$'\t''\1-/'  | awk '{print int($1/10)*10,$3}' | grep -i front | sort | uniq -c | awk '{print $1}' > voorpagina_artikelen_per_decennium.txt

# Show and explanation of output:
echo -e "art\tdec\tfront_art"

# Create output by pasting the previously created text files
paste artikelen_per_decennium.txt voorpagina_artikelen_per_decennium.txt 
