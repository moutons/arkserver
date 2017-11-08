# Ark: Survival Evolved Chef Cookbook
[![Build Status](https://travis-ci.org/f0rkz/chef-arkserver.svg)](https://travis-ci.org/f0rkz/chef-arkserver)[![Cookbook Version](https://img.shields.io/cookbook/v/chef-arkserver.svg)](https://supermarket.chef.io/cookbooks/chef-arkserver)

This cookbook will install and configure an Ark: Survival Evolved dedicated
server. Utilize the following README for more information on how to utilize this
cookbook.

## Usage

Include `chef-arkserver` in your node's runlist

## Configuration
In order to properly utilize this cookbook, a suite of default configuration
options are included in the cookbook's `attributes/default.rb` file. You will
need to override the default options in your cookbook's node configuration.

An example of overriding configuration options is structured as follows:

```json
{
  "name": "my.ark.server.net",
  "chef_environment": "_default",
  "normal": {
    "ark": {
      "gameserver": {
        "configuration": {
          "map": "ScorchedEarth_P",
          "ServerSettings": {
            "XPMultiplier": "5.0000",
            "TamingSpeedMultiplier": "2.0000",
            "RCONPort": 27025
          },
          "SessionSettings": {
            "SessionName": "My Ark Dedicated Server"
          },
          "MessageOfTheDay": {
            "Message": "Welcome to my ARK Server dot Net\nPlease enjoy your stay!"
          }
        }
      }
    },
    "tags": [

    ]
  },
  "policy_name": null,
  "policy_group": null,
  "run_list": [
  "role[base]",
  "recipe[]"
]

}
```

This configuration will build your `GameUserSettings.ini` file with the requested
overrided options defined above.
