import json
with open('cx_summaryConsole.txt') as f:
    html_string=f.readlines()
    title='![Logo](https://user-images.githubusercontent.com/42570337/152954017-2101d077-2be7-48a8-8d34-618fe5a7c779.png)\n'
    output=title
    for s in html_string:
        output += "###"+s
    dictionary = {
        "body": output
    }
    json_object = json.dumps(dictionary, indent=4)
    with open("cx_github_pullrequest_comment.json", "w") as outfile:
        outfile.write(json_object)
