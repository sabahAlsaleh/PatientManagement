# PatientManagement

## Description

PatientManagement Service is an event-based application designed to manage patient-related data and events. It provides functionalities to register new patients and retrieve patient-related events. The service is built with Spring Boot and utilizes an event-driven architecture to handle patient registration events.

## Features
- Patient Registration: Register new patients with their personal information.
- Event-Driven Architecture: Utilize event-driven approach for handling patient registration events.
- RESTful API: Provide RESTful endpoints for seamless integration.


## Technologies Used

- Java
- Spring Boot
- Maven
- Docker
- Kafka
- EventStoreDB

## Installation

To set up the PatientManagement, you will need Java and Maven installed on your system. Follow these steps:

1. Clone the repository.
2. Navigate to the terminal.
3. Run `./mvnw package` to build the project.

## Configuration

The application can be run on the KTH cloud or locally by adjusting the `application.properties` file.

### Running on the KTH Cloud (CBHCloud)

For running on the KTH cloud, ensure the following properties are set in `application.properties`:

```properties
# Cloud configurations
spring.kafka.bootstrap-servers=vm.cloud.cbh.kth.se:2558
eventstoredb.connection-string=esdb://vm.cloud.cbh.kth.se:2569?tls=false

eventstoredb.stream.name=patient-registration
patient.registration.topic=patient-registration-topic
spring.kafka.consumer.group-id=patient-registration-group
spring.kafka.consumer.group-id-getevents=patient-registration-group-getevents
spring.kafka.consumer.auto-offset-reset=earliest
spring.kafka.consumer.key-deserializer=org.apache.kafka.common.serialization.StringDeserializer
spring.kafka.consumer.value-deserializer=org.springframework.kafka.support.serializer.JsonDeserializer
spring.kafka.consumer.properties.spring.json.value.default.type=kth.system.healthcare.PatientRegistrationService.model.PatientRegisteredEvent
spring.kafka.consumer.properties.spring.json.trusted.packages=*
spring.kafka.producer.key-serializer=org.apache.kafka.common.serialization.StringSerializer
spring.kafka.producer.value-serializer=org.springframework.kafka.support.serializer.JsonSerializer
```

### Running Locally with Docker Compose
 Docker Compose for Kafka & EventDB
  You can find the Docker Compose configuration for Kafka and EventDB in the [LabResultService](https://github.com/sabahAlsaleh/LabResultService)  repository.
 For running locally with Docker Compose, adjust the following configurations:

```properties
server.port:8082
spring.kafka.bootstrap-servers=localhost:9092
eventstoredb.connection-string=esdb://localhost:2113?tls=false


# Common configurations
server.port=8082
eventstoredb.stream.name=patient-registration
patient.registration.topic=patient-registration-topic
spring.kafka.consumer.group-id=patient-registration-group
spring.kafka.consumer.group-id-getevents=patient-registration-group-getevents
spring.kafka.consumer.auto-offset-reset=earliest
spring.kafka.consumer.key-deserializer=org.apache.kafka.common.serialization.StringDeserializer
spring.kafka.consumer.value-deserializer=org.springframework.kafka.support.serializer.JsonDeserializer
spring.kafka.consumer.properties.spring.json.value.default.type=kth.system.healthcare.PatientRegistrationService.model.PatientRegisteredEvent
spring.kafka.consumer.properties.spring.json.trusted.packages=*
spring.kafka.producer.key-serializer=org.apache.kafka.common.serialization.StringSerializer
spring.kafka.producer.value-serializer=org.springframework.kafka.support.serializer.JsonSerializer
```

## Usage

Once PatientManagement Service is up and running, you can interact with it using the following endpoints:

- **Create a New Lab Result on cloud :**
  To add a new lab result, use the following `POST` request with the appropriate payload:
  ```
  http://patientmanagement.app.cloud.cbh.kth.se/patients/register
  ```
   ```
  Content-Type: application/json

  {
    "id": "12345",
    "name": "John Doe",
    "dateOfBirth": "1990-01-01",
    "email": "johndoe@example.com",
    "phoneNumber": "123-456-7890"
  }
  ```
- **Retrieve a Patient on cloud:**
  To get all lab results, use the following `GET` request:
  ```
  http://patientmanagement.app.cloud.cbh.kth.se/patients/events
  ```
  
 - **Create a New Patient Locally:**
   To add a new patient, use the following `POST` request with the appropriate payload:
   ```
    http://localhost:8082/patients/register
   ```
   ```
   Content-Type: application/json

   {
    "id": "12345",
    "name": "John Doe",
    "dateOfBirth": "1990-01-01",
    "email": "johndoe@example.com",
    "phoneNumber": "123-456-7890"
   }

   ```
 - **Retrieve a Lab Result locally:**
  To get all lab results, use the following `GET` request:
   ```
   http://localhost:8082/patients/events
   ```



## LabResult Service Repository

For the LabResult service functionality, please refer to the [LabResultService](https://github.com/sabahAlsaleh/LabResultService) repository. If you want to run Docker Compose for Kafka and EventDB within the LabResultService project, the Docker Compose configuration needs to be executed there.


## Contributing

Current contributors:
- Sabah Alsaleh
- Lowe Lindholm
- Rona Kala
```
