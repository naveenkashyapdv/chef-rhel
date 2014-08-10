RHEL Cookbook
=============
Provides resources for subscription management

Requirements
------------
- `RHEL` - 7.0

#### packages
- `subscription-manager`

Resource/Provider
-----------------

### rhel_registration

#### actions

- **register** - registers the node
- **unregister** - unregisters the node

#### attributes

- **proxy** - String - proxy url
- **proxyuser** - String -proxy user
- **proxypassword** - String - proxy password
- **hostname** - String - system name
- **username** - String -username for submanagement auth
- **password** - String - password for submanagement auth
- **serverurl** - String - server url
- **insecure** - Boolean - do not check server ssl
- **baseurl** - String -base url for content
- **type** - String - type of unit to register
- **org** - String - org key
- **environment** - String - environment in org
- **release** - Strin - release version
- **auto_attach** - Boolean - sets --auto-attach flag
- **force** - Boolean - sets --force flag
- **activationkey** - String - activation key to use
- **servicelevel** - String - system preference when subscribing

### rhel_subscription

#### actions

- **attach** - attaches the subscription
- **remove** - removes the subscription

#### attributes

- **proxy** - String - proxy url
- **proxyuser** - String - proxy user
- **proxypassword** - String - proxy password
- **pool** - Array - 1 or more ids for subscriptions
- **quantity** - Integer - number of subscriptions to attach
- **auto** - Boolean - automatically attach the best match
- **serial** - Array - one or more serials to use with remove
- **servicelevel** - sets the service level to use for subscriptions
- **all** - remove all subscriptions

Usage
-----
#### rhel::default
Just include `rhel` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[rhel]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
- Author:: Jim Rosser(jarosser06@gmail.com)

```text
copyright (C) 2014 Jim Rosser

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the “Software”), to deal in the Software without restriction,
including without limitation the rights to use, copy, modify, merge,
publish, distribute, sublicense, and/or sell copies of the Software,
and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
```
