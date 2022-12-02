import json
with open('cx_summaryConsole.txt') as f:
    html_string=f.readlines()
    title='![checkmarx_circleci](https://user-images.githubusercontent.com/99268939/205370786-3aa37659-b5d3-4a44-a48c-ae501470a729.png)\n'
    output=title
    for s in html_string:
        if 'Details' in s:
            output += "#####"+s
        else:
            output += s
    dictionary = {
        "body": output
    }
    json_object = json.dumps(dictionary, indent=4)
    with open("cx_github_pullrequest_comment.json", "w") as outfile:
        outfile.write(json_object)
