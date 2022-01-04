# docker-okta-awscli-java

Run Okta CLI with Python AWS sdks.

## Usage

1. Create `config.properties` and set **OKTA_ORG** and **OKTA_AWS_APP_URL** appropriately. For example,

   ```properties
   OKTA_ORG=acmecorp.oktapreview.com
   OKTA_AWS_APP_URL=https://acmecorp.oktapreview.com/home/amazon_aws/0oa5zrwfs815KJmVF0h7/137
   OKTA_BROWSER_AUTH=false
   ```

2. Build image:
   ```shell
   docker build -t docker-okta-awscli-java .
   ```

3. Run this command:
   ```shell
   docker run -v ${PWD}/config.properties:/root/.okta/config.properties -it docker-okta-awscli-java
   ```

## Configuring

    [okta-aws-cli-assume-role](https://github.com/oktadev/okta-aws-cli-assume-role#configuring-the-application).
