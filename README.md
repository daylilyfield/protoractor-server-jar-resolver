protoractor-server-jar-resolver
===============================

selenium jar file location resolver for protractor.

How to Install
--------------

```bash
npm install -D protractor-server-jar-resolver
```

How to Use
----------

you need to call this module as function in protractor.config.js like this:

```javascript

module.exports = {
  
  seleniumServerJar: require('protractor-server-jar-resolver')()

}
```

API
---

### (options: Object) -> String

- options.seleniumDir: String
  
  a directory where selenium jar files are located. default value is ``${module install location}/../protractor/selenium/``

- options.filePattern: Regex

  a regex pattern which checks whether a file name is selenium jar or not. you need to specify 3 match-groups in this regexp as major version, minor version and rev version. default value is ``/^selenium-server-standalone-([\d]+)\.([\d]+)\.([\d]+)\.jar$/``.

License
-------

Copyright © 2015 daylilyfield

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
