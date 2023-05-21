// ESM
import Fastify from 'fastify'
const fastify = Fastify({
  logger: true
})

fastify.get('/', function (request, reply) {
  reply.send({ hello: 'world' })
})

fastify.listen({ host: '0.0.0.0' , port: process.env.PORT || 3000 }, function (err, address) {
  if (err) {
    fastify.log.error(err)
    process.exit(1)
  }
})