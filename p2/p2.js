// SIGTERM handler
process.on('SIGTERM', () => {

  setTimeout(() => {
    console.log('p2 terminating')
    process.exit(0)
  }, 5000)

})

// Do some work
setInterval(() => console.log('running p2'), 3000)
