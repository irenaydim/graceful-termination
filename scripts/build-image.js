const childProcess = require('child_process')
const fs = require('fs')
const path = require('path')

process.on('unhandledRejection', (err) => {
  throw err
})

const package = JSON.parse(fs.readFileSync(path.resolve(__dirname, '..', 'package.json')))

const arch = process.argv[2] || 'amd64'

const commandLine = `docker build --build-arg ARCH=${arch} --compress --force-rm -t ${package.name}.${arch}:${package.version} .`
childProcess.execSync(commandLine, { stdio: 'inherit' })
