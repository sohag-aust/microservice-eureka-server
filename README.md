### Eureka Server

### To run this service (eureka service) we need to run the configserver microservice first

### Eureka Server dashboard
    http://localhost:8070/

### Check config server gets eureka server configuration from config-properties repository eurekaserver.yml properly, using the following url
    http://localhost:8071/eurekaserver/default

### To view all registered services in eureka server
    http://localhost:8070/eureka/apps

    to view the result in json format, hit the url in the postman