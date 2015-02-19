path = require 'path'

resolver = require '../src'

describe 'protractor server jar resolver', ->

  it 'should find selenium jar file', ->
    jar = resolver
      seleniumDir: path.resolve __dirname, '../node_modules/protractor/selenium'

    expect(path.basename jar).toMatch /^selenium-server-standalone-.*$/

  it 'should find earlier major version', ->
    jar = resolver
      seleniumDir: path.resolve __dirname, 'fixtures/multi/major'
    expect(path.basename jar).toMatch /^selenium-server-standalone-2.*$/

  it 'should find earlier major version (tens place)', ->
    jar = resolver
      seleniumDir: path.resolve __dirname, 'fixtures/multi/major-ten'
    expect(path.basename jar).toMatch /^selenium-server-standalone-10.*$/

  it 'should find earlier minor version', ->
    jar = resolver
      seleniumDir: path.resolve __dirname, 'fixtures/multi/minor'
    expect(path.basename jar).toMatch /^selenium-server-standalone-1\.22.*$/

  it 'should find earlier minor version (tens place)', ->
    jar = resolver
      seleniumDir: path.resolve __dirname, 'fixtures/multi/minor-ten'
    expect(path.basename jar).toMatch /^selenium-server-standalone-1\.10.*$/

  it 'should find earlier rev version', ->
    jar = resolver
      seleniumDir: path.resolve __dirname, 'fixtures/multi/rev'
    expect(path.basename jar).toMatch /^selenium-server-standalone-1\.11\.22.*$/

  it 'should find earlier rev version (tens place)', ->
    jar = resolver
      seleniumDir: path.resolve __dirname, 'fixtures/multi/rev-ten'
    expect(path.basename jar).toMatch /^selenium-server-standalone-1\.1\.10.*$/
