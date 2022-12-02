import json

with open('./cx_result.json') as f:
    data=json.load(f)
for d in data:
    if d=='scanID' :
        print data[d]
