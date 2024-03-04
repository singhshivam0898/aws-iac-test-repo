﻿# aws-iac-test-repo
# this is the fisrst iac code


#!/bin/sh

# Task 1: Create an index named 'sample'
curl -X PUT "localhost:9200/sample" -H 'Content-Type: application/json' -d '{}'

# Task 2: Feed sample.json into 'sample' index
curl -X POST "localhost:9200/sample/user_data" -H 'Content-Type: application/json' -d @sample.json > output2.txt

# Task 3: List available indices
curl -X GET "localhost:9200/_cat/indices?v" > output3.txt

# Task 4: List documents with category 'Books'
curl -X GET "localhost:9200/sample/_search?q=category:Books" > output4.txt

# Task 5: Update 'message' field to 'Null'
curl -X POST "localhost:9200/sample/_update_by_query" -H 'Content-Type: application/json' -d '{"script": {"source": "ctx._source.message = \\"Null\\""}}' > output5.txt

# Task 6: Bool Query for specific documents
curl -X GET "localhost:9200/sample/_search" -H 'Content-Type: application/json' -d '{"query": {"bool": {"must": {"term": {"gender": "female"}}, "must_not": {"term": {"category": "Clothing"}}}}}' > output6.txt

# Task 7: List documents with brand 'Tata_tea'
curl -X GET "localhost:9200/sample/_search?q=brand:Tata_tea" > output7.txt
