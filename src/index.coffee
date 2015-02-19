fs = require 'fs'
path = require 'path'

SELENIUM_JAR_FILE_PATTERN = ///
  ^selenium-server-standalone-
  ([\d]+) # major
  \.
  ([\d]+) # minor
  \.
  ([\d]+) # rev
  \.jar$
///

SELENIUM_DIR = path.resolve __dirname, '../../protractor/selenium/'

# Array x -> Array x -> Array Array x
zip = (xs, ys) -> xs.map (x, i) -> [x, ys[i]]

# Array x -> Array x
dropHead = (xs) -> xs.concat().splice(1)

# String -> String -> Boolean
isSeleniumJarFile = (pattern) -> (file) -> file.match pattern

# Regexp -> String -> String -> Integer
byVersionNumber = (pattern) -> (left, right) ->
  compareVersionNumber dropHead zip (pattern.exec left), (pattern.exec right)

# String -> Integer
toInt = (v) -> parseInt v

# Array Array Integer -> Integer
compareVersionNumber = (xys) ->
  return 0 if xys.length is 0
  [x, y] = xys.shift().map toInt
  switch
    when x < y then -1
    when x > y then 1
    else compareVersionNumber xys

# String -> String -> String
makeAbsolute = (root) -> (file) -> path.resolve root, file

# String -> ()
fail = (dir) -> throw new Error("No selenium jar file found at: #{dir}")

# Object -> String
resolveSeleniumJarPath = (options = {}) ->
  pattern = options.filePattern ? SELENIUM_JAR_FILE_PATTERN
  dir = options.seleniumDir ?= SELENIUM_DIR

  fs.readdirSync(dir)
    .filter isSeleniumJarFile(pattern)
    .sort byVersionNumber(pattern)
    .map makeAbsolute(dir)
    .pop() or fail(dir)

module.exports = resolveSeleniumJarPath
