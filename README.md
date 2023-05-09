# cxone_reporting_circleci

This is an sample script how to enable the decoration of Checkmarx Pull Request using github and CircleCI.

Checkmarx Document link:
https://checkmarx.com/resource/documents/en/34965-68653-utils.html#UUID-f98c3771-a704-19b8-ca8e-19de5bae609b

setup procedure:
1. copy .circleci/config.yml file to the .circleci folder of your repo

2. Create the following environment variables at the project settings of Circle CI
  CX_API_KEY : Checkmarx One API Key
  CX_BASE_AUTH_URI : Checkmarx One Authentication URL
  CX_BASE_URI : Checkmarx One Server Base URL
  CX_TENANT	: your tenant name of Checkmarx One
  GH_TOKEN	: Github token
  GH_USER	: Github Username

reference: https://checkmarx.com/resource/documents/en/34965-68721-checkmarx-one-circleci-integration.html#UUID-7fde03f0-8bce-049a-730b-6e6d12f59353_id_ASTCircleCIIntegration-InitialSetup

3. test your configuration of CircleCI
