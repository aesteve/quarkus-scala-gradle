package com.github.aesteve.quarkus.scala

import javax.ws.rs.core.MediaType
import javax.ws.rs.{GET, Path, Produces}

@Path("/greetings")
class Greetings {

  @GET
  @Path("/hello")
  @Produces(Array(MediaType.TEXT_PLAIN))
  def sayHello: String = "Hello Scala!"


}
