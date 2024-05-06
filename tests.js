const assert = require('assert')
const axios = require('axios')

axios.get('http://localhost:3000')
  .then(response => {
    assert.strictEqual(response.data, 'Hello World!')
    console.log('Test passed successfully!')
  })
  .catch(error => {
    console.error('Test failed:', error.message)
  })
