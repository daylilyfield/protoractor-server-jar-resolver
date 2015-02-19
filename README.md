protoractor-server-jar-resolver
===============================

selenium jar file location resolver for protractor.

How to Install
--------------

```bash
npm install -D protoractor-server-jar-resolver
```

How to Use
----------

you need to call this module as function in protractor.config.js like this:

```javascript

module.exports = {
  
  seleniumServerJar: require('protoractor-server-jar-resolver)()

}
```

API
---

### (options: Object) -> String

- options.seleniumDir: String
  
  a directory where selenium jar files are located. default value is ``${module install location}/../protractor/selenium/``

- options.filePattern: Regex

  a regex pattern which checks whether a file name is selenium jar or not. you need to specify 3 match-groups in this regexp as major version, minor version and rev version. default value is ``/^selenium-server-standalone-([\d]+)\.([\d]+)\.([\d]+)\.jar$/``.

