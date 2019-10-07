Awstoken is a bash wrapper around awscli for easy temporary security credential generation for AWS API.

More about AWS temporary security credential [here](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp.html).

Main purpose is to be able easily to force MFA for all users even for API access.
More about forcing MFA [here](https://www.trek10.com/blog/improving-the-aws-force-mfa-policy-for-IAM-users/).
Now developers AWS_KEY will never be introduced into production :)

## Install

- download *.awstoken* into your *$HOME* folder
- source *.awstoken* into your bash/zsh/ksh env `. ~/.awstoken`

`curl -s https://raw.githubusercontent.com/vandot/awstoken/master/install.sh | bash`


## Requirements

  1. [awscli](https://aws.amazon.com/cli/) - `pip install awscli`

## Usage

- Basic usage `awstoken -u user -t 123456 -a 012345678910`
- You can specify different aws profiles defined inside `~/.aws/credentials` using **-p**
- For help `awstoken -h`

## Power usage

You can put user and account variables inside profile block in `~/.aws/credentials`, awscli just skips those values so credential file is still valid.
```
[default]
aws_access_key_id = AWSACCESSKEY
aws_secret_access_key = AWSSECRETACCESSKEY
user = username
account = 012345678910
```

## How it works

After obtaining temporary security credentials using `sts get-session-token` sets and exports 
- *AWS_ACCESS_KEY_ID*
- *AWS_SECRET_ACCESS_KEY*
- *AWS_SESSION_TOKEN*

## License

Unless otherwise noted, the awstoken source files and binaries are distributed under the BSD-style license found in the LICENSE file.