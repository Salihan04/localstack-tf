const handler = (payload, context, callback) => {
  callback(null, {
    statusCode: 200,
    body: JSON.stringify({
      message: 'Hello from Lambda'
    })
  });
}

module.exports = {
  handler
}