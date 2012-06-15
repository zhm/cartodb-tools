# cartodb-tools

Command line tool to import and show details about data in your CartoDB account.

## Installation

    gem install cartodb-tools

## Configuration

Configuration of your API credentials and server can either be done with a `.cartodbrc` file
in your `$HOME` directory, or by using environment variables. The `.cartodbrc` file is a YAML
file that contains your account information.

Here is a sample `.cartodbrc` file:

```yaml
host: 'https://username.cartodb.com'
oauth_key: 'YOUR AUTH KEY'
oauth_secret: 'YOUR AUTH SECRET'
username: 'your username/email'
password: 'your password'
```

or, for environment variables:

```sh
export CARTODB_HOST="https://username.cartodb.com"
export CARTODB_OAUTHKEY="YOUR AUTH KEY"
export CARTODB_OAUTHSECRET="YOUR AUTH SECRET"
export CARTODB_USERNAME="your username/email"
export CARTODB_PASSWORD="your password"
```

Note: the environment variables override the settings in the `.cartodbrc` file. You can define a mix,
so just your password can be an environment variable if you like.

## Usage

There are 3 supported commands currently, `import`, `ls`, and `show`

    cartodb import -t "table_name" -f /path/to/some.csv -g Point

    cartodb ls

    cartodb show -t table_name

Note: for some reason, the API is not naming the tables properly. This happens on the current cartodb.com
hosted version and self-hosted instances.
