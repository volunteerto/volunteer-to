run-api:
	docker build -t volunteer-to-api -f cmd/volunteer-to-api/Dockerfile .
	docker run -p 80:80 volunteer-to-api

run-db:
	docker build -t volunteer-to-db -f cmd/volunteer-to-db/Dockerfile .
	docker run -p 8000:8000 volunteer-to-db

env-target:
ifndef TARGET
	    $(error TARGET is undefined)
endif

build: env-target
	docker build -t $(TARGET) -f cmd/$(TARGET)/Dockerfile .
