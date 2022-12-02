#!/bin/bash
sudo apt-get install jq
pr_response=$(curl --location --request GET "https://api.github.com/repos/$CIRCLE_PROJECT_USERNAME/$CIRCLE_PROJECT_REPONAME/pulls?head=$CIRCLE_PROJECT_USERNAME:$CIRCLE_BRANCH&state=open" \
-u $GH_USER:$GH_TOKEN)
#echo "pr_response:"
#echo $pr_response
if [ $(echo $pr_response | jq length) -eq 0 ]; then
  echo "No PR found to update"
else
  python --version
  export CX_SCANID=$(python cxone_reporting_circleci/get_scanID_from_file.py)
  ../cx \
  results show --scan-id=$CX_SCANID \
  --base-uri $CX_BASE_URI \
  --base-auth-uri $CX_BASE_AUTH_URI \
  --tenant $CX_TENANT \
  --apikey $CX_API_KEY \
  --report-format summaryConsole > cx_summaryConsole.txt
  cat cx_summaryConsole.txt
  python cxone_reporting_circleci/pullrequest_comment.py

  pr_comment_url=$(echo $pr_response | jq -r ".[]._links.comments.href")
  curl --location --request POST "$pr_comment_url" \
  -u $GH_USER:$GH_TOKEN \
  --header 'Content-Type: application/json' \
  --data "@cx_github_pullrequest_comment.json"
fi
