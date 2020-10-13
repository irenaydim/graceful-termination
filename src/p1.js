// SIGTERM handler
process.on('SIGTERM', () => {

  setTimeout(() => {
    console.log('p1 terminating')
    process.exit(0)
  }, 1000)

})

// Do some work
setInterval(() => console.log('running p1'), 3000)
