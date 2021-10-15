terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.63.0"
    }
  }
}

provider "aws" {
  access_key = "" # (Optional) This is the AWS access key. It must be provided, but it can also be sourced from the AWS_ACCESS_KEY_ID environment variable, or via a shared credentials file if profile is specified.
  secret_key = "" # (Optional) This is the AWS secret key. It must be provided, but it can also be sourced from the AWS_SECRET_ACCESS_KEY environment variable, or via a shared credentials file if profile is specified.
  region     = "" # (Optional) This is the AWS region. It must be provided, but it can also be sourced from the AWS_DEFAULT_REGION environment variables, or via a shared credentials file if profile is specified.
  profile    = "" # (Optional) This is the AWS profile name as set in the shared credentials file.

  assume_role {                                                                   # (Optional) An assume_role block (documented below). Only one assume_role block may be in the configuration.
    duration_seconds = 900                                                        # (Optional) Number of seconds to restrict the assume role session duration. You can provide a value from 900 seconds (15 minutes) up to the maximum session duration setting for the role.
    external_id      = ""                                                         # (Optional) External identifier to use when assuming the role.
    policy           = ""                                                         # (Optional) IAM Policy JSON describing further restricting permissions for the IAM Role being assumed.
    policy_arns      = ["arn:aws:iam::000000000000:policy/policy-name-with-path"] # (Optional) Set of Amazon Resource Names (ARNs) of IAM Policies describing further restricting permissions for the IAM Role being assumed.
    role_arn         = ""                                                         # (Optional) Amazon Resource Name (ARN) of the IAM Role to assume.
    session_name     = ""                                                         # (Optional) Session name to use when assuming the role.
    tags = {                                                                      # (Optional) Map of assume role session tags.
      Name        = "name"
      Descritpion = "Imported to terraform."
      Environment = "Test"
    }
    transitive_tag_keys = ["Name", "Description", "Environment"] # (Optional) Set of assume role session tag keys to pass to any subsequent sessions.
  }

  http_proxy = "" # (Optional) The address of an HTTP proxy to use when accessing the AWS API. Can also be configured using the HTTP_PROXY or HTTPS_PROXY environment variables.

  endpoints { # (Optional) Configuration block for customizing service endpoints.
    accessanalyzer         = "http://localhost:4566"
    acm                    = ""
    acmpca                 = ""
    amplify                = ""
    apigateway             = ""
    appconfig              = ""
    applicationautoscaling = ""
    applicationinsights    = ""
    appmesh                = ""
    apprunner              = ""
    appstream              = ""
    appsync                = ""
    athena                 = ""
    auditmanager           = ""
    autoscaling            = ""
    autoscalingplans       = ""
    backup                 = ""
    batch                  = ""
    budgets                = ""
    chime                  = ""
    cloud9                 = ""
    cloudcontrolapi        = ""
    cloudformation         = ""
    cloudfront             = ""
    cloudhsm               = ""
    cloudsearch            = ""
    cloudtrail             = ""
    cloudwatch             = ""
    cloudwatchevents       = ""
    cloudwatchlogs         = ""
    codeartifact           = ""
    codebuild              = ""
    codecommit             = ""
    codedeploy             = ""
    codepipeline           = ""
    codestarconnections    = ""
    #codestarnotifications        = ""
    cognitoidentity    = ""
    cognitoidp         = ""
    configservice      = ""
    connect            = ""
    cur                = ""
    dataexchange       = ""
    datapipeline       = ""
    datasync           = ""
    dax                = ""
    detective          = ""
    devicefarm         = ""
    directconnect      = ""
    dlm                = ""
    dms                = ""
    docdb              = ""
    ds                 = ""
    dynamodb           = ""
    ec2                = ""
    ecr                = ""
    ecrpublic          = ""
    ecs                = ""
    efs                = ""
    eks                = ""
    elasticache        = ""
    elasticbeanstalk   = ""
    elastictranscoder  = ""
    elb                = ""
    emr                = ""
    emrcontainers      = ""
    es                 = ""
    firehose           = ""
    fms                = ""
    forecast           = ""
    fsx                = ""
    gamelift           = ""
    glacier            = ""
    globalaccelerator  = ""
    glue               = ""
    guardduty          = ""
    greengrass         = ""
    iam                = ""
    identitystore      = ""
    imagebuilder       = ""
    inspector          = ""
    iot                = ""
    iotanalytics       = ""
    iotevents          = ""
    kafka              = ""
    kinesis            = ""
    kinesisanalytics   = ""
    kinesisanalyticsv2 = ""
    kinesisvideo       = ""
    kms                = ""
    lakeformation      = ""
    lambda             = ""
    lexmodels          = ""
    licensemanager     = ""
    lightsail          = ""
    location           = ""
    macie              = ""
    macie2             = ""
    managedblockchain  = ""
    marketplacecatalog = ""
    mediaconnect       = ""
    mediaconvert       = ""
    medialive          = ""
    mediapackage       = ""
    mediastore         = ""
    mediastoredata     = ""
    memorydb           = ""
    mq                 = ""
    mwaa               = ""
    neptune            = ""
    networkfirewall    = ""
    networkmanager     = ""
    opsworks           = ""
    organizations      = ""
    outposts           = ""
    personalize        = ""
    pinpoint           = ""
    pricing            = ""
    #prometheusservice            = ""
    qldb                         = ""
    quicksight                   = ""
    ram                          = ""
    rds                          = ""
    redshift                     = ""
    resourcegroups               = ""
    resourcegroupstaggingapi     = ""
    route53                      = ""
    route53domains               = ""
    route53recoverycontrolconfig = ""
    route53recoveryreadiness     = ""
    route53resolver              = ""
    s3                           = ""
    s3control                    = ""
    s3outposts                   = ""
    sagemaker                    = ""
    schemas                      = ""
    sdb                          = ""
    secretsmanager               = ""
    securityhub                  = ""
    serverlessrepo               = ""
    servicecatalog               = ""
    servicediscovery             = ""
    servicequotas                = ""
    ses                          = ""
    shield                       = ""
    signer                       = ""
    sns                          = ""
    sqs                          = ""
    ssm                          = ""
    ssoadmin                     = ""
    stepfunctions                = ""
    storagegateway               = ""
    sts                          = ""
    swf                          = ""
    synthetics                   = ""
    timestreamwrite              = ""
    transfer                     = ""
    waf                          = ""
    wafregional                  = ""
    wafv2                        = ""
    worklink                     = ""
    workmail                     = ""
    workspaces                   = ""
    xray                         = ""
  }

  shared_credentials_file = ""                               # (Optional) This is the path to the shared credentials file. If this is not set and a profile is specified, ~/.aws/credentials will be used.
  token                   = ""                               # (Optional) Session token for validating temporary credentials. Typically provided after successful identity federation or Multi-Factor Authentication (MFA) login. With MFA login, this is the session token provided afterward, not the 6 digit MFA code used to get temporary credentials. It can also be sourced from the AWS_SESSION_TOKEN environment variable.
  max_retries             = 25                               # (Optional) This is the maximum number of times an API call is retried, in the case where requests are being throttled or experiencing transient failures. The delay between the subsequent API calls increases exponentially. If omitted, the default value is 25.
  allowed_account_ids     = ["000000000000", "111111111111"] # (Optional) List of allowed AWS account IDs to prevent you from mistakenly using an incorrect one (and potentially end up destroying a live environment). Conflicts with forbidden_account_ids.
  #forbidden_account_ids   = ["222222222222", "333333333333"] # (Optional) List of forbidden AWS account IDs to prevent you from mistakenly using the wrong one (and potentially end up destroying a live environment). Conflicts with allowed_account_ids.

  default_tags { # (Optional) Configuration block with resource tag settings to apply across all resources handled by this provider (see the Terraform multiple provider instances documentation for more information about additional provider configurations). This is designed to replace redundant per-resource tags configurations. Provider tags can be overridden with new values, but not excluded from specific resources. To override provider tag values, use the tags argument within a resource to configure new tag values for matching keys. See the default_tags Configuration Block section below for example usage and available arguments. This functionality is supported in all resources that implement tags, with the exception of the aws_autoscaling_group resource.
    tags = {
      Environment = "Test"
      Name        = "Provider Tag"
      Description = "Imported to terraform"
    }
  }

  ignore_tags { # (Optional) Configuration block with resource tag settings to ignore across all resources handled by this provider (except any individual service tag resources such as aws_ec2_tag) for situations where external systems are managing certain resource tags. Arguments to the configuration block are described below in the ignore_tags Configuration Block section. See the Terraform multiple provider instances documentation for more information about additional provider configurations.
    keys         = ["TagKey1"]
    key_prefixes = ["Key"]
  }

  insecure                    = false # (Optional) Explicitly allow the provider to perform "insecure" SSL requests. If omitted, the default value is false.
  skip_credentials_validation = true  # (Optional) Skip the credentials validation via the STS API. Useful for AWS API implementations that do not have STS available or implemented.
  skip_get_ec2_platforms      = true  # (Optional) Skip getting the supported EC2 platforms. Used by users that don't have ec2:DescribeAccountAttributes permissions.
  skip_region_validation      = false # (Optional) Skip validation of provided region name. Useful for AWS-like implementations that use their own region names or to bypass the validation for regions that aren't publicly available yet.
  skip_requesting_account_id  = false # (Optional) Skip requesting the account ID. Useful for AWS API implementations that do not have the IAM, STS API, or metadata API.
}
