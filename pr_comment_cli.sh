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
  utils pr github --scan-id=$CX_SCANID \
  --base-uri $CX_BASE_URI \
  --base-auth-uri $CX_BASE_AUTH_URI \
  --tenant $CX_TENANT \
  --apikey $CX_API_KEY \
  --namespace $CIRCLE_PROJECT_USERNAME \
  --reo-name $CIRCLE_PROJECT_REPONAME \
  --pr-number $pr_response
fi
exit 0
